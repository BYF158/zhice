<template>
  <div class="app-container">
    <!-- 隐藏搜索框（答题页面无需搜索功能） -->
    <el-form
      :model="queryParams"
      ref="queryForm"
      size="small"
      :inline="true"
      v-show="false"
      label-width="68px"
    >
      <el-form-item label="题目类别" prop="prototypeId">
        <el-input
          v-model="queryParams.prototypeId"
          placeholder="请输入题目类别"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <!-- 答题进度与标题 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="24">
        <div class="title-container">
          <h3>原型探索量表</h3>
          <p>共 {{ totalQuestions }} 题 · 每页6题 · 请根据实际情况选择</p>
          <el-progress
            :percentage="progress"
            stroke-width="6"
            style="margin: 10px 0;"
          ></el-progress>
          <p class="page-info">第 {{ currentPage }} / {{ totalPages }} 页</p>
        </div>
      </el-col>
    </el-row>

    <!-- 题目列表 -->
    <el-card>
      <div v-loading="loading" class="question-list">
        <div
          v-for="(question, index) in topicList"
          :key="question.topicId"
          class="question-item"
        >
          <div class="question-header">
            <span class="question-number">{{ (currentPage - 1) * 6 + index + 1 }}.</span>
            <span class="question-content">{{ question.topicContent }}</span>
          </div>

          <el-radio-group
            v-model="question.userScore"
            class="answer-options"
            @change="handleAnswerChange(question.topicId, $event)"
          >
            <el-radio
              v-for="(score, sIdx) in scoreOptions"
              :key="sIdx"
              :label="score.value"
              class="score-option"
            >
              {{ score.value }}. {{ score.desc }}
            </el-radio>
          </el-radio-group>
        </div>
      </div>
    </el-card>

    <!-- 分页按钮 -->
    <el-row :gutter="10" class="mb8">
      <el-col :span="24" class="text-center">
        <el-button
          type="primary"
          plain
          icon="el-icon-arrow-left"
          @click="prevPage"
          :disabled="currentPage === 1"
        >上一页</el-button>

        <el-button
          type="primary"
          icon="el-icon-arrow-right"
          @click="nextOrSubmit"
          :loading="submitting"
        >
          <span v-if="currentPage < totalPages">下一页</span>
          <span v-else>提交答卷</span>
        </el-button>
      </el-col>
    </el-row>

    <!-- 未完成提示弹窗 -->
    <el-dialog
      title="提示"
      :visible.sync="showAlert"
      width="30%"
      append-to-body
    >
      <p>当前页面还有题目未完成，请选择答案后再继续</p>
      <span slot="footer" class="dialog-footer">
        <el-button @click="showAlert = false">确定</el-button>
      </span>
    </el-dialog>

    <!-- 提交成功提示 -->
    <el-dialog
      title="成功"
      :visible.sync="showSuccess"
      width="30%"
      append-to-body
    >
      <p>答卷提交成功！正在为您生成结果...</p>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="toResultPage">查看结果</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { submitAnswers, getResult, getQuestionByPage } from "@/api/questions/topic";

export default {
  name: "TestPage",
  data() {
    return {
      // 基础参数
      loading: false,
      submitting: false,
      showAlert: false,
      showSuccess: false,
      totalQuestions: 72, // 总题数
      totalPages: 12, // 总页数72/6
      currentPage: 1,
      recordId: null, // 提交后返回的记录ID

      // 题目数据
      topicList: [], // 当前页题目列表
      queryParams: {
        pageNum: 1,
        pageSize: 6,
        prototypeId: null // 题目类别（预留筛选字段）
      },

      // 答案存储
      answerMap: {}, // { topicId: score }

      // 分数选项
      scoreOptions: [
        { value: 1, desc: "从来没有" },
        { value: 2, desc: "很少" },
        { value: 3, desc: "有时" },
        { value: 4, desc: "时常" },
        { value: 5, desc: "总是" }
      ]
    };
  },
  computed: {
    // 进度百分比
    progress() {
      return (this.currentPage / this.totalPages) * 100;
    }
  },
  created() {
    // 从本地存储恢复答案
    const savedAnswers = localStorage.getItem("testAnswers");
    if (savedAnswers) {
      this.answerMap = JSON.parse(savedAnswers);
    }
    this.getList();
  },
  methods: {
    /** 查询当前页题目 */
    getList() {
      this.loading = true;

      getQuestionByPage(this.queryParams.pageNum, this.queryParams.pageSize)
        .then(response => {
          // 使用后端返回的分页数据
          const pageSize = this.queryParams.pageSize;
          const pageNum = this.queryParams.pageNum;
          console.log("response:",response);

          const total = response.length; // 总题数
          const start = (pageNum - 1) * pageSize;
          const end = start + pageSize;
          const paginatedData = response.slice(start, end);

          // 赋值给 topicList 并关联答案
          this.topicList = paginatedData.map(question => ({
            ...question,
            userScore: this.answerMap[question.topicId] || null
          }));

          // 更新总题数和总页数
          this.totalQuestions = total;
          this.totalPages = Math.ceil(total / pageSize);

          this.loading = false;
        })
        .catch(error => {
          this.$message.error("题目加载失败，请重试");
          this.loading = false;
        });
    },

    /** 处理答案选择 */
    handleAnswerChange(topicId, score) {
      this.answerMap[topicId] = score;
      // 保存到本地存储
      localStorage.setItem("testAnswers", JSON.stringify(this.answerMap));
    },

    /** 上一页 */
    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        this.queryParams.pageNum = this.currentPage;
        this.getList();
        window.scrollTo(0, 0);
      }
    },

    /** 下一页或提交 */
    nextOrSubmit() {
      // 检查当前页是否全部答题
      const allAnswered = this.topicList.every(question =>
        question.userScore !== null && question.userScore !== undefined
      );

      if (!allAnswered) {
        this.showAlert = true;
        return;
      }

      // 最后一页提交
      if (this.currentPage === this.totalPages) {
        this.submitAnswers();
        return;
      }

      // 下一页
      this.currentPage++;
      this.queryParams.pageNum = this.currentPage;
      this.getList();
      window.scrollTo(0, 0);
    },

    /** 提交所有答案 */
    submitAnswers() {
      this.submitting = true;
      // 构造提交数据
      const answerList = Object.entries(this.answerMap).map(([topicId, score]) => ({
        topicId: parseInt(topicId),
        score: parseInt(score)
      }));

      submitAnswers({ answers: answerList }).then(response => {
        this.recordId = response.data.recordId;
        this.showSuccess = true;
        // 清除本地存储
        localStorage.removeItem("testAnswers");
      }).catch(error => {
        this.$message.error("提交失败，请重试");
      }).finally(() => {
        this.submitting = false;
      });
    },

    /** 前往结果页 */
    toResultPage() {
      this.$router.push({
        path: "/result",
        query: { recordId: this.recordId }
      });
    },

    /** 搜索与重置（预留方法，保持接口一致） */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.queryParams = {
        pageNum: 1,
        pageSize: 6,
        prototypeId: null
      };
      this.handleQuery();
    }
  }
};
</script>

<style scoped>
.title-container {
  text-align: center;
  padding: 10px 0;
}

.title-container h3 {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
}

.page-info {
  color: #606266;
  font-size: 14px;
}

.question-list {
  padding: 20px 0;
}

.question-item {
  padding: 15px 0;
  border-bottom: 1px solid #f5f7fa;
}

.question-header {
  margin-bottom: 15px;
  display: flex;
  align-items: flex-start;
}

.question-number {
  font-weight: bold;
  margin-right: 10px;
  color: #409eff;
}

.question-content {
  flex: 1;
  font-size: 15px;
  line-height: 1.6;
}

.answer-options {
  margin-left: 24px;
  display: flex;
  flex-wrap: wrap;
  gap: 10px 20px;
}

.score-option {
  margin-right: 20px;
  white-space: nowrap;
}

/* 适配移动端 */
@media (max-width: 768px) {
  .answer-options {
    flex-direction: column;
    margin-left: 0;
  }

  .score-option {
    margin-bottom: 8px;
  }
}
</style>
