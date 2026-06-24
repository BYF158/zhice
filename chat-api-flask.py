#!/usr/bin/env python3
"""
小核聊天API服务器 (Flask版本)
兼容Python 3.6，提供实时连接
"""

from flask import Flask, request, jsonify, Response, send_from_directory
from flask_cors import CORS
import json
import os
from datetime import datetime
import threading
import time

app = Flask(__name__)
CORS(app)  # 允许跨域

# 配置
API_VERSION = "1.0.0"
SERVER_ADDRESS = "120.27.244.95"
SERVER_PORT = 8080

# 存储会话数据
sessions = {}

@app.route('/')
def index():
    """主页 - 提供聊天界面"""
    try:
        return send_from_directory('/root/.openclaw/workspace', 'chat-ui-chatgpt.html')
    except Exception as e:
        return f"Error: {str(e)}", 404

@app.route('/chat-ui.html')
def chat_ui():
    """直接提供聊天界面"""
    return index()

@app.route('/api/chat', methods=['POST'])
def chat():
    """处理聊天消息"""
    try:
        data = request.json
        message = data.get('message', '')
        session_id = data.get('session_id', '')
        
        if not session_id:
            return jsonify({'error': 'session_id required'}), 400
        
        # 保存用户消息到会话
        if session_id not in sessions:
            sessions[session_id] = []
        
        sessions[session_id].append({
            "role": "user",
            "content": message,
            "timestamp": datetime.now().isoformat()
        })
        
        # 生成AI响应
        response_content = generate_ai_response(message)
        
        # 保存AI响应
        sessions[session_id].append({
            "role": "assistant",
            "content": response_content,
            "timestamp": datetime.now().isoformat()
        })
        
        return jsonify({
            "content": response_content,
            "timestamp": datetime.now().isoformat()
        })
        
    except Exception as e:
        print(f"Error processing message: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/sessions/<session_id>', methods=['GET'])
def get_session(session_id):
    """获取会话历史"""
    if session_id not in sessions:
        return jsonify({"messages": []})
    return jsonify({"messages": sessions[session_id]})

@app.route('/api/sessions/<session_id>', methods=['DELETE'])
def delete_session(session_id):
    """删除会话"""
    if session_id in sessions:
        del sessions[session_id]
    return jsonify({"message": "Session deleted"})

@app.route('/health')
def health_check():
    """健康检查"""
    return jsonify({
        "status": "ok",
        "timestamp": datetime.now().isoformat(),
        "version": API_VERSION
    })

def generate_ai_response(message):
    """
    生成AI响应
    当前返回模拟响应
    TODO: 集成OpenClaw TUI API
    """
    responses = {
        "default": "收到！让我来帮你分析这个问题。",
        "你好": "你好！我是小核 ⚛️，有什么可以帮助你的？",
        "help": "我可以帮你：\n1. 解答技术问题\n2. 编写代码\n3. 分析文档\n4. 进行软件工程任务\n\n请告诉我你需要什么帮助！",
        "帮助": "我可以帮你：\n1. 解答技术问题\n2. 编写代码\n3. 分析文档\n4. 进行软件工程任务\n\n请告诉我你需要什么帮助！",
        "再见": "再见！有问题随时找我～",
        "test": "系统运行正常！✅",
        "测试": "系统运行正常！✅"
    }
    
    # 简单的关键词匹配
    for keyword, response in responses.items():
        if keyword in message.lower() and keyword != "default":
            return response
    
    return responses["default"]

def keep_alive():
    """保持服务器运行"""
    while True:
        time.sleep(60)

# 启动服务器
if __name__ == "__main__":
    print("""
    ╔══════════════════════════════════════╗
    ║   小核聊天API服务器启动中...          ║
    ╠══════════════════════════════════════╣
    ║  HTTP服务器: http://{}:{:d}     ║
    ║  聊天界面:  http://{}:{:d}/    ║
    ║  API文档:    http://{}:{:d}/health ║
    ╠══════════════════════════════════════╣
    ║  按 Ctrl+C 停止服务器                ║
    ╚══════════════════════════════════════╝
    """.format(SERVER_ADDRESS, SERVER_PORT, SERVER_ADDRESS, SERVER_PORT, SERVER_ADDRESS, SERVER_PORT))
    
    # 启动保活线程
    keep_alive_thread = threading.Thread(target=keep_alive)
    keep_alive_thread.daemon = True
    keep_alive_thread.start()
    
    # 启动Flask服务器
    app.run(host='0.0.0.0', port=SERVER_PORT, debug=False)