<template>
  <div class="app-container">
    <h2>性格测试</h2>
    <!-- 进度条 -->
    <el-progress :percentage="safePercentage" style="margin-bottom: 20px"></el-progress>

    <!-- 题干 -->
    <h3>请从每一行描述中选择最适合描述您性格特点的一项（若你不能肯定哪个是“最合适”,请问你的配偶和朋友，并考虑：当你还是小孩时，哪个该是答案）。</h3>

    <!-- 选项列表 -->
    <el-card class="question-card" :style="{ cursor: 'default' }" v-if="currentOptions.length > 0">
      <div class="options-grid">
        <div v-for="(question, index) in currentOptions" :key="question.questionNumber" class="question-item">
          <div class="question-content">
            <span class="question-number">{{ (index + 1) + (currentPage - 1) * questionsPerPage }}.</span>
            <span class="question-text">{{ question.questionText }}</span>
          </div>
          <el-radio-group v-model="userSelections[question.questionNumber]" @change="saveToLocalStorage" class="options-group">
            <div v-for="option in question.options" :key="option.optionId" class="option-container">
              <el-radio
                :label="option.optionType"
                class="option-radio"
                @mouseenter="showTooltip(option.optionDefinition)"
                @mouseleave="hideTooltip"
              >
                <!-- 鼠标悬浮时显示选项定义 -->
                <el-tooltip :content="option.optionDefinition" placement="top">
                  <span class="option-text">{{ option.optionText }}</span>
                </el-tooltip>
              </el-radio>
            </div>
          </el-radio-group>
        </div>
      </div>
    </el-card>
    <div v-else>
      <p>加载中...</p>
    </div>

    <!-- 导航按钮 -->
    <div style="margin-top: 30px; text-align: center">
      <el-button @click="prevPage" :disabled="currentPage <= 1">上一页</el-button>
      <el-button @click="nextPage" :disabled="!canNextPage">下一页</el-button>
      <el-button type="primary" @click="submitAnswers" v-if="currentPage === totalPages">
        提交
      </el-button>
    </div>
  </div>
</template>

<script>
import { listOptions } from "@/api/options/options";
import { addOptionRecord, addPersonalityResult } from "@/api/personality/options";

export default {
  name: "AssessmentTest",
  data() {
    return {
      currentPage: 1,
      userSelections: {}, // 用户选择记录：{1: "S", 2: "C", ...}
      currentOptions: [], // 当前页的问题和选项
      allOptions: {},     // 缓存所有题目的对象（以 questionNumber 为 key）
      questionsPerPage: 10,
      totalQuestions: 0,
      isLoading: false,
      tooltipVisible: false,
      currentTooltip: '',
      recordId: null,
      scores: {           // 新增字段：存储四种人格类型的得分
        typeSScore: 0,
        typeCScore: 0,
        typeMScore: 0,
        typePScore: 0
      }
    };
  },
  created() {
    this.restoreFromLocalStorage();
    this.getQuestions(); // 初始化加载题目
  },
  watch: {
    currentPage(newPage) {
      this.getQuestions(); // 每次页码变化时重新加载题目
    }
  },
  computed: {
    totalPages() {
      return Math.ceil(this.totalQuestions / this.questionsPerPage);
    },
    canNextPage() {
      const start = (this.currentPage - 1) * this.questionsPerPage + 1;
      const end = start + this.questionsPerPage - 1;
      for (let i = start; i <= end && i <= this.totalQuestions; i++) {
        if (!this.userSelections[i]) {
          return false;
        }
      }
      return true;
    },
    safePercentage() {
      return this.totalPages > 0 ? Math.floor(this.currentPage / this.totalPages * 100) : 0;
    }
  },
  methods: {
    /** 按页加载选项数据 */
    getQuestions() {
      if (this.isLoading) return;

      this.isLoading = true;

      listOptions({
        pageNum: this.currentPage,
        pageSize: this.questionsPerPage * 4 // 每题4个选项
      })
        .then(response => {
          const rows = response.rows;

          if (!this.totalQuestions) {
            this.totalQuestions = response.total / 4;
          }

          // 将返回的选项数据按问题分组
          const questions = {};
          rows.forEach(item => {
            if (!questions[item.questionNumber]) {
              questions[item.questionNumber] = {
                questionNumber: item.questionNumber,
                questionText: item.questionText,
                options: []
              };
            }
            questions[item.questionNumber].options.push({
              optionId: item.optionId,
              optionType: item.optionType,
              optionText: item.optionText,
              optionDefinition: item.optionDefinition
            });
          });

          // 更新当前页数据
          this.currentOptions = Object.values(questions);

          // 合并到 allOptions（避免重复覆盖）
          Object.keys(questions).forEach(qNum => {
            this.allOptions[qNum] = questions[qNum];
          });

          this.isLoading = false;
        })
        .catch(() => {
          this.isLoading = false;
          this.$modal.msgError("加载题目失败，请重试");
        });
    },

    /** 上一页 */
    prevPage() {
      if (this.currentPage > 1) {
        this.currentPage--;
        this.saveToLocalStorage();
      }
    },

    /** 下一页 */
    nextPage() {
      if (this.currentPage < this.totalPages && this.canNextPage) {
        this.currentPage++;
        this.saveToLocalStorage();
      }
    },

    /** 动态计算S/C/M/P得分 */
    calculateScores() {
      const scores = {
        userId: null,
        typeSScore: 0,
        typeCScore: 0,
        typeMScore: 0,
        typePScore: 0
      };

      for (const key in this.userSelections) {
        const type = this.userSelections[key];
        if (type && scores[`type${type}Score`] !== undefined) {
          scores[`type${type}Score`] += 1;
        }
      }

      this.scores = scores;
    },

    /** 提交答案 */
    submitAnswers() {
      // 防止重复提交
      if (this.isLoading) return;

      // 验证是否完成所有题目
      const allAnswered = Object.keys(this.userSelections).length === this.totalQuestions;
      if (!allAnswered) {
        this.$modal.msgError("请完成所有题目后再提交");
        return;
      }

      this.isLoading = true; // 设置加载状态

      // 构建答案ID列表
      const selectedOptionIds = [];
      for (let i = 1; i <= this.totalQuestions; i++) {
        const optionType = this.userSelections[i];

        // 使用 allOptions 获取题号对应的所有选项
        const question = this.allOptions[i];
        if (question) {
          const selectedOption = question.options.find(opt => opt.optionType === optionType);
          if (selectedOption) {
            selectedOptionIds.push(selectedOption.optionId);
          }
        }
      }

      // 获取用户ID
      const userId = localStorage.getItem("userId");

      // 调用API提交答案（保存每道题的选择）
      addOptionRecord({ userId, selectedOptionIds })
        .then(response => {
          this.$modal.msgSuccess("答题完成，成绩已保存");

          // 保存recordId用于后续查询结果
          this.recordId = response.data;

          // 计算得分
          this.calculateScores();

          // 将 userId 添加到 scores 中
          this.scores.userId = userId;

          // 提交得分数据到后端
          addPersonalityResult(this.scores)
            .then(() => {
              console.log('得分数据提交成功');
            })
            .catch(error => {
              console.error('得分数据提交失败:', error);
              this.$modal.msgWarning("得分数据提交失败，但答题记录已保存");
            });

          // 清除本地存储
          this.clearLocalStorage();

          // 跳转到结果页面
          this.$router.push({
            path: '/personality/personalityResult',

          });
        })
        .catch(() => {
          this.$modal.msgError("提交失败，请重试");
        });
    },


    saveToLocalStorage() {
      const state = {
        currentPage: this.currentPage,
        userSelections: this.userSelections,
        timestamp: new Date().getTime()
      };
      localStorage.setItem("assessmentProgress", JSON.stringify(state));
    },

    restoreFromLocalStorage() {
      const savedState = localStorage.getItem("assessmentProgress");
      if (savedState) {
        try {
          const state = JSON.parse(savedState);
          const oneDay = 24 * 60 * 60 * 1000;
          if (new Date().getTime() - state.timestamp < oneDay) {
            this.currentPage = state.currentPage || 1;
            this.userSelections = state.userSelections || {};
            this.getQuestions(); // 恢复时重新加载问题
          } else {
            this.clearLocalStorage();
          }
        } catch (e) {
          console.error("恢复进度失败", e);
          this.clearLocalStorage();
        }
      }
    },

    clearLocalStorage() {
      localStorage.removeItem("assessmentProgress");
    },

    showTooltip(definition) {
      this.currentTooltip = definition;
      this.tooltipVisible = true;
    },

    hideTooltip() {
      this.tooltipVisible = false;
    }
  },
  beforeUnmount() {
    this.saveToLocalStorage();
  }
};
</script>

<style scoped>
.app-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.card-header {
  font-size: 18px;
  font-weight: bold;
}

.question-card {
  transition: all 0.3s ease;
  margin-bottom: 15px;
}

.question-item {
  display: grid;
  grid-template-columns: 50px 1fr 1fr 1fr 1fr;
  align-items: center;
  margin-bottom: 20px;
  border-bottom:  rgba(0, 0, 0, 0.1);
}

.question-number {
  font-weight: bold;
}

.question-text {
  margin-right: 20px;
}

.options-group {
  display: contents;
}

.option-container {
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.option-radio {
  display: flex;
  align-items: center;
  cursor: pointer;
}

.option-text {
  margin-right: 5px;
}

.tooltip-trigger {
  cursor: pointer;
  transition: all 0.2s;
}

.tooltip-trigger:hover {
  background-color: #f5f7fa;
}

.submit-btn {
  text-align: center;
  margin-top: 30px;
}

.divider {
  height: 1px;
  background-color: #e0e0e0;
  margin: 10px 0;
}

::v-deep .el-tooltip__popper {
  max-width: 200px;
  padding: 8px 12px;
  font-size: 13px;
}

/* 手机端适配 */
@media (max-width: 768px) {
  .question-item {
    display: block;
  }

  .options-group {
    display: block;
  }

  .option-container {
    margin-bottom: 20px;
  }
}
</style>
