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
          <el-progress :percentage="progress"
          :stroke-width="6"
          style="margin: 10px 0;">
          </el-progress>
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
      loading: false,
      submitting: false,
      showAlert: false,
      showSuccess: false,
      totalQuestions: 0,
      totalPages: 0,
      currentPage: 1,
      recordId: null,
      topicList: [],
      queryParams: {
        pageNum: 1,
        pageSize: 6,
        prototypeId: null
      },
      answerMap: {},
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
    progress() {
      return this.totalPages > 0 ? Math.min(100, (this.currentPage / this.totalPages) * 100) : 0;
    }
  },
  created() {
    const savedAnswers = localStorage.getItem("testAnswers");
    if (savedAnswers) {
      this.answerMap = JSON.parse(savedAnswers);
    }
    this.getList();
  },
  methods: {
    /** 查询当前页题目 */
    async getList() {
  this.loading = true;
  try {
    const response = await getQuestionByPage(this.currentPage, this.queryParams.pageSize);
    console.log('接口返回:', response); // 👈 调试用
    console.log('接口数据:', response);

    console.log('接口数据:', response.list);
    const pageData = response.data;
    console.log('分页数据:', pageData); // 👈 调试用

    if (!pageData || !Array.isArray(pageData.list)) {
      this.$message.error('接口数据格式错误');
      return;
    }

    // 设置题目列表及答案状态
    this.topicList = pageData.list.map(question => ({
      ...question,
      userScore: this.answerMap[question.topicId] || null
    }));

    // 更新总题数和总页数
    this.totalQuestions = pageData.total;
    this.totalPages = pageData.pages;
    this.queryParams.pageNum = this.currentPage;

  } catch (error) {
    console.error('加载失败:', error);
    this.$message.error("题目加载失败，请重试");
  } finally {
    this.loading = false;
  }
},

    /** 处理答案选择 */
    handleAnswerChange(topicId, score) {
      this.$set(this.answerMap, topicId, score); // 使用$set确保响应式
      localStorage.setItem("testAnswers", JSON.stringify(this.answerMap));
    },

    /** 上一页 */
    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        this.getList();
        window.scrollTo(0, 0);
      }
    },

    /** 下一页或提交 */
    nextOrSubmit() {
      // 检查当前页是否所有题目都已作答
      const currentPageQuestions = this.topicList;
      const allAnswered = currentPageQuestions.every(q => q.userScore !== null && q.userScore !== undefined);

      if (!allAnswered) {
        this.showAlert = true;
        return;
      }

      if (this.currentPage >= this.totalPages) {
        this.submitAnswers();
        return;
      }

      this.currentPage++;
      this.getList();
      window.scrollTo(0, 0);
    },

    /** 提交所有答案 */
    submitAnswers() {
      this.submitting = true;
      const answerList = Object.entries(this.answerMap).map(([topicId, score]) => ({
        topicId: parseInt(topicId),
        score: parseInt(score)
      }));

      submitAnswers({ answers: answerList })
        .then(response => {
          this.recordId = response.data.recordId;
          this.showSuccess = true;
          localStorage.removeItem("testAnswers");
        })
        .catch(() => {
          this.$message.error("提交失败，请重试");
        })
        .finally(() => {
          this.submitting = false;
        });
    },

    toResultPage() {
      this.$router.push({
        path: "/result",
        query: { recordId: this.recordId }
      });
    },

    handleQuery() {
      this.currentPage = 1;
      this.getList();
    },

    resetQuery() {
      this.queryParams = {
        pageNum: 1,
        pageSize: 6,
        prototypeId: null
      };
      this.currentPage = 1;
      this.getList();
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
