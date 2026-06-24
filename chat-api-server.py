#!/usr/bin/env python3
"""
小核聊天API服务器 - 连接OpenClaw真实对话
兼容Python 3.6
"""

from flask import Flask, request, jsonify, Response, send_from_directory
from flask_cors import CORS
import json
import os
import sys
import subprocess
import traceback
from datetime import datetime

app = Flask(__name__)
CORS(app)

# 配置
API_VERSION = "1.0.0"
SERVER_ADDRESS = "120.27.244.95"
SERVER_PORT = 8080
STATIC_DIR = os.path.dirname(os.path.abspath(__file__))

# 会话缓存 {session_id: history}
sessions = {}

@app.route('/')
def index():
    """提供聊天界面"""
    return send_from_directory(STATIC_DIR, 'chat-ui.html')

@app.route('/health')
def health_check():
    """健康检查"""
    return jsonify({
        "status": "ok",
        "timestamp": datetime.now().isoformat(),
        "version": API_VERSION
    })

@app.route('/api/chat', methods=['POST'])
def chat():
    """处理聊天消息 - 调用OpenClaw获取真实回复"""
    try:
        data = request.get_json()
        message = data.get('message', '').strip()
        session_id = data.get('session_id', '')
        files = data.get('files', [])

        if not session_id:
            return jsonify({'error': 'session_id is required'}), 400

        # 如果有文件，在消息中添加文件信息
        file_info = ""
        if files:
            file_list = []
            for f in files:
                name = f.get('name', '未知文件')
                ftype = f.get('type', '')
                size = f.get('size', 0)
                file_list.append(f"{name} ({_format_size(size)})")
            file_info = "\n[用户上传了文件: " + ", ".join(file_list) + "]\n"

        full_message = file_info + message if message else file_info.strip()

        if not full_message:
            return jsonify({'error': 'message or files required'}), 400

        # 保存用户消息（含文件信息）
        user_msg = {
            "role": "user",
            "content": full_message,
            "timestamp": datetime.now().isoformat()
        }
        if files:
            user_msg["files"] = [{"name": f["name"], "type": f.get("type", ""), "size": f.get("size", 0)} for f in files]
        if session_id not in sessions:
            sessions[session_id] = []
        sessions[session_id].append(user_msg)

        # 调用OpenClaw获取回复
        reply = call_openclaw(full_message, session_id)

        # 保存AI回复
        ai_msg = {
            "role": "assistant",
            "content": reply,
            "timestamp": datetime.now().isoformat()
        }
        sessions[session_id].append(ai_msg)

        return jsonify({
            "content": reply,
            "timestamp": ai_msg["timestamp"]
        })

    except Exception as e:
        print("=" * 60)
        print("ERROR in /api/chat:")
        traceback.print_exc()
        print("=" * 60)
        return jsonify({'error': str(e)}), 500

@app.route('/api/sessions/<session_id>', methods=['GET'])
def get_session(session_id):
    """获取会话历史"""
    return jsonify({"messages": sessions.get(session_id, [])})

@app.route('/api/sessions/<session_id>', methods=['DELETE'])
def delete_session(session_id):
    """删除会话"""
    if session_id in sessions:
        del sessions[session_id]
    return jsonify({"message": "deleted"})


def call_openclaw(message, session_id):
    """
    调用 OpenClaw agent 获取真实回复
    使用 openclaw agent --message "..." --json --session-id "..."
    """
    try:
        result = subprocess.run(
            ["openclaw", "agent",
             "--message", message,
             "--json",
             "--session-id", session_id],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            timeout=120  # 2分钟超时
        )

        stdout = result.stdout.decode('utf-8', errors='replace').strip()
        stderr = result.stderr.decode('utf-8', errors='replace').strip()

        if result.returncode != 0:
            print(f"OpenClaw error (code {result.returncode}): {stderr[:200]}")
            return f"⚠️ 调用OpenClaw失败: {stderr[:200]}"

        # 解析JSON输出
        data = json.loads(stdout)

        # OpenClaw 返回: result.payloads[0].text
        payloads = data.get("result", {}).get("payloads", [])
        if payloads:
            reply = payloads[0].get("text", "")
            if reply:
                return reply

        # 兜底: 直接返回全部文本
        return _extract_text(data, stdout[:1000])

    except subprocess.TimeoutExpired:
        print(f"OpenClaw timeout for session {session_id}")
        return "⏰ 请求超时，请稍后重试"
    except json.JSONDecodeError:
        return stdout[:500] if stdout else "⚠️ 返回格式异常"
    except Exception as e:
        print(f"OpenClaw call error: {e}")
        traceback.print_exc()
        return f"⚠️ 调用AI出错: {str(e)}"


def _extract_text(data, fallback):
    """递归尝试从响应中提取文本"""
    if isinstance(data, str):
        return data
    if isinstance(data, dict):
        for key in ["text", "content", "message", "reply", "response"]:
            if key in data:
                val = data[key]
                if isinstance(val, str) and val:
                    return val
                return _extract_text(val, fallback)
        # 取第一个非空字符串值
        for v in data.values():
            result = _extract_text(v, fallback)
            if result:
                return result
    if isinstance(data, list):
        for item in data:
            result = _extract_text(item, fallback)
            if result:
                return result
    return fallback


def _format_size(size):
    """格式化文件大小"""
    if not size:
        return "0B"
    size = int(size)
    if size < 1024:
        return f"{size}B"
    elif size < 1048576:
        return f"{size/1024:.1f}KB"
    else:
        return f"{size/1048576:.1f}MB"


if __name__ == "__main__":
    print("""
    ╔══════════════════════════════════════╗
    ║   小核聊天API服务器 🚀               ║
    ╠══════════════════════════════════════╣
    ║  模式: OpenClaw 真实对话              ║
    ║  监听: http://0.0.0.0:{:d}         ║
    ║  外网: http://{:s}:{:d}   ║
    ╠══════════════════════════════════════╣
    ║  按 Ctrl+C 停止                      ║
    ╚══════════════════════════════════════╝
    """.format(SERVER_PORT, SERVER_ADDRESS, SERVER_PORT))

    app.run(host='0.0.0.0', port=SERVER_PORT, debug=False)
