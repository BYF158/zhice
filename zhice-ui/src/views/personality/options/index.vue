<template>
  <div class="container">
    <!-- 页面标题 -->
    <div class="test-title">
      <h1>性格类型测试</h1>
      <p>请从每一行描述中选择最符合您的一项（每行仅选一项）</p>
    </div>

    <!-- 优点部分 -->
    <el-card class="mb-6">
      <template #header>
        <div class="card-header">
          <i class="fa fa-thumbs-up mr-2"></i>优点部分
        </div>
      </template>
      <el-card__body>
        <!-- 类型标题行 -->
        <div class="category-header">
          <el-col :span="6" class="s-category">
            <i class="fa fa-smile-o mr-2"></i>S（活泼型）
          </el-col>
          <el-col :span="6" class="c-category">
            <i class="fa fa-bolt mr-2"></i>C（力量型）
          </el-col>
          <el-col :span="6" class="m-category">
            <i class="fa fa-paint-brush mr-2"></i>M（完美型）
          </el-col>
          <el-col :span="6" class="p-category">
            <i class="fa fa-leaf mr-2"></i>P（和平型）
          </el-col>
        </div>

        <!-- 优点选项行 -->
        <div v-for="(row, index) in advantageRows" :key="index" class="option-row">
          <el-row>
            <el-col :span="6">
              <el-radio-group v-model="advantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.advantage[index].soption"
                  effect="light"
                >
                  <el-radio
                    :label="'s-' + index"
                    class="tooltip-trigger"
                    :id="'option_' + (index * 4 + 1)"
                  >{{ row.soption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="advantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.advantage[index].coption"
                  effect="light"
                >
                  <el-radio
                    :label="'c-' + index"
                    class="tooltip-trigger"
                    :id="'option_' + (index * 4 + 2)"
                  >{{ row.coption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="advantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.advantage[index].moption"
                  effect="light"
                >
                  <el-radio
                    :label="'m-' + index"
                    class="tooltip-trigger"
                    :id="'option_' + (index * 4 + 3)"
                  >{{ row.moption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="advantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.advantage[index].poption"
                  effect="light"
                >
                  <el-radio
                    :label="'p-' + index"
                    class="tooltip-trigger"
                    :id="'option_' + (index * 4 + 4)"
                  >{{ row.poption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
          </el-row>
        </div>
      </el-card__body>
    </el-card>

    <!-- 缺点部分 -->
    <el-card class="mb-6">
      <template #header>
        <div class="card-header">
          <i class="fa fa-thumbs-down mr-2"></i>缺点部分
        </div>
      </template>
      <el-card__body>
        <!-- 类型标题行 -->
        <div class="category-header">
          <el-col :span="6" class="s-category">
            <i class="fa fa-smile-o mr-2"></i>S（活泼型）
          </el-col>
          <el-col :span="6" class="c-category">
            <i class="fa fa-bolt mr-2"></i>C（力量型）
          </el-col>
          <el-col :span="6" class="m-category">
            <i class="fa fa-paint-brush mr-2"></i>M（完美型）
          </el-col>
          <el-col :span="6" class="p-category">
            <i class="fa fa-leaf mr-2"></i>P（和平型）
          </el-col>
        </div>

        <!-- 缺点选项行 -->
        <div v-for="(row, index) in disadvantageRows" :key="index" class="option-row">
          <el-row>
            <el-col :span="6">
              <el-radio-group v-model="disadvantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].soption"
                  effect="light"
                >
                  <el-radio
                    :label="'s-' + index"
                    class="tooltip-trigger"
                    :id="'option_' + (80 + index * 4 + 1)"
                  >{{ row.soption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="disadvantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].coption"
                  effect="light"
                >
                  <el-radio
                    :label="'c-' + index"
                    class="tooltip-trigger"
                    :id="'option_' + (80 + index * 4 + 2)"
                  >{{ row.coption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="disadvantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].moption"
                  effect="light"
                >
                  <el-radio
                    :label="'m-' + index"
                    class="tooltip-trigger"
                    :id="'option_' + (80 + index * 4 + 3)"
                  >{{ row.moption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
            <el-col :span="6">
              <el-radio-group v-model="disadvantageAnswers[index]">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].poption"
                  effect="light"
                >
                  <el-radio
                    :label="'p-' + index"
                    class="tooltip-trigger"
                    :id="'option_' + (80 + index * 4 + 4)"
                  >{{ row.poption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
            </el-col>
          </el-row>
        </div>
      </el-card__body>
    </el-card>

    <!-- 统计结果 -->
    <el-card v-if="showResults" class="mb-6">
      <template #header>
        <div class="card-header">
          <i class="fa fa-bar-chart mr-2"></i>性格测试结果
        </div>
      </template>
      <el-card__body>
        <el-row :gutter="20">
          <el-col :span="6" v-for="(type, key) in resultTypes" :key="key">
            <el-card :class="`type-card ${type.colorClass}`">
              <div class="type-header">
                <i :class="type.icon"></i>
                <span>{{ type.name }}</span>
              </div>
              <div class="type-scores">
                <div class="score-item advantage">
                  <span class="score-label">优点分:</span>
                  <span class="score-value">{{ type.advantageScore }}</span>
                </div>
                <div class="score-item disadvantage">
                  <span class="score-label">缺点分:</span>
                  <span class="score-value">{{ type.disadvantageScore }}</span>
                </div>
                <div class="score-item total">
                  <span class="score-label">总分:</span>
                  <span class="score-value">{{ type.totalScore }}</span>
                </div>
              </div>
              <div class="type-progress">
                <el-progress :percentage="type.percentage" :color="type.color"></el-progress>
              </div>
            </el-card>
          </el-col>
        </el-row>

        <div class="personality-analysis mt-6">
          <h3>性格分析</h3>
          <p v-if="dominantType">{{ analysisTexts[dominantType] }}</p>
          <p v-else>请完成所有问题后查看分析结果</p>
        </div>
      </el-card__body>
    </el-card>

    <!-- 提交按钮 -->
    <div class="submit-btn">
      <el-button
        type="primary"
        size="large"
        @click="submitAnswers"
        :loading="isLoading"
      >
        {{ showResults ? '重新测试' : '提交答案' }}
      </el-button>
    </div>
  </div>
</template>

<script>
import {addOptionRecord, listPersonalityOptions, selectOptionDefinition,addPersonalityResult} from "@/api/personality/options";

export default {
  name: 'PersonalityTest',
  data() {
    return {
      // 结果表格数据
      postList: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,

      },
      // 优点选项数据
      advantageRows: [
        // { s: '生动', c: '富于冒险', m: '善于分析', p: '适应力强' },
        // { s: '喜好娱乐', c: '善于说服', m: '坚持不懈', p: '平和' },
        // 其余数据保持不变...
      ],

      // 缺点选项数据
      disadvantageRows: [
        // { s: '靠骨', c: '专横', m: '忸怩', p: '乏味' },
        // { s: '散漫', c: '无同情心', m: '不宽恕', p: '缺乏热情' },
        // 其余数据保持不变...
      ],

      // 选项解释（鼠标悬停时显示）
      advantageTooltips: {
        advantage: [
          // { s: '性格活泼，能给周围带来活力', c: '愿意尝试新事物，不怕挑战', m: '擅长思考和分析问题', p: '能适应不同环境和变化' },
          // { s: '喜欢轻松愉快的活动和氛围', c: '能有效说服他人接受观点', m: '做事有毅力，不轻易放弃', p: '心态平和，不易动怒' },
          // 其余数据保持不变...
        ],
        disadvantage: [
          // { s: '过于依赖他人，缺乏独立', c: '专断蛮横，听不进意见', m: '举止不自然，过于拘谨', p: '性格乏味，缺乏情趣' },
          // { s: '生活散漫，缺乏规律', c: '对他人处境缺乏同情心', m: '心胸狭窄，不轻易原谅', p: '缺乏热情和积极性' },
          // 其余数据保持不变...
        ]
      },

      // 答案存储
      advantageAnswers: Array(20).fill(''),
      disadvantageAnswers: Array(20).fill(''),

      // 存储选择的选项ID（改为存储整数）
      selectedOptionIds: [],

      // 状态
      isLoading: false,
      showResults: false,

      // 结果数据
      resultTypes: {
        s: { name: '活泼型(S)', advantageScore: 0, disadvantageScore: 0, totalScore: 0, color: '#f56c6c', colorClass: 's-type', icon: 'fa fa-smile-o', percentage: 0 },
        c: { name: '力量型(C)', advantageScore: 0, disadvantageScore: 0, totalScore: 0, color: '#409eff', colorClass: 'c-type', icon: 'fa fa-bolt', percentage: 0 },
        m: { name: '完美型(M)', advantageScore: 0, disadvantageScore: 0, totalScore: 0, color: '#e6a23c', colorClass: 'm-type', icon: 'fa fa-paint-brush', percentage: 0 },
        p: { name: '和平型(P)', advantageScore: 0, disadvantageScore: 0, totalScore: 0, color: '#909399', colorClass: 'p-type', icon: 'fa fa-leaf', percentage: 0 }
      },

      // 分析文本
      analysisTexts: {
        s: '您的性格类型主要是活泼型(S)。您热情开朗、善于社交，喜欢成为众人瞩目的焦点。您富有创造力，乐观积极，能够给周围的人带来活力和快乐。不过，您可能有时会过于冲动，缺乏耐心，需要注意保持专注和坚持。',
        c: '您的性格类型主要是力量型(C)。您自信果断、勇于挑战，具有很强的领导能力和决策力。您目标明确，行动力强，能够迅速解决问题。不过，您可能有时会过于强势，缺乏耐心倾听他人的意见，需要注意团队合作和沟通技巧。',
        m: '您的性格类型主要是完美型(M)。您细致认真、追求完美，具有很强的分析能力和责任心。您注重细节，善于规划，能够高质量地完成工作。不过，您可能有时会过于挑剔，对自己和他人要求过高，需要注意放松心态和享受生活。',
        p: '您的性格类型主要是和平型(P)。您温和友善、善于协调，具有很强的同理心和包容心。您喜欢和谐的环境，能够与他人友好相处。不过，您可能有时会过于迁就他人，缺乏主见，需要注意表达自己的需求和想法。'
      }
    }
  },
  computed: {
    // 计算主导性格类型
    dominantType() {
      const maxScore = Math.max(
        this.resultTypes.s.totalScore,
        this.resultTypes.c.totalScore,
        this.resultTypes.m.totalScore,
        this.resultTypes.p.totalScore
      );

      if (maxScore === 0) return null;

      const dominantTypes = Object.keys(this.resultTypes).filter(
        key => this.resultTypes[key].totalScore === maxScore
      );

      return dominantTypes.length > 0 ? dominantTypes[0] : null;
    }
  },

  created() {
    this.getList()

  },

  methods: {

    //查询

    /** 查询列表 */
    getList() {

      listPersonalityOptions(this.queryParams).then(response => {
        // this.postList = response.rows;
        this.advantageRows=response.rows.slice(0, 20);
        this.disadvantageRows=response.rows.slice(20,40);
      })
      selectOptionDefinition(this.queryParams).then(response => {
        // this.postList = response.rows;
        this.advantageTooltips.advantage=response.rows.slice(0, 20);
        this.advantageTooltips.disadvantage=response.rows.slice(20,40);
      })
      ()
    },
    // 提交答案
    submitAnswers() {

      // 当已显示结果时，点击按钮重置测试
      if (this.showResults) {
        // 清空所有选中项
        this.advantageAnswers = Array(20).fill('');
        this.disadvantageAnswers = Array(20).fill('');
        // 隐藏结果区域
        this.showResults = false;
        // 重置得分
        Object.keys(this.resultTypes).forEach(key => {
          this.resultTypes[key].advantageScore = 0;
          this.resultTypes[key].disadvantageScore = 0;
          this.resultTypes[key].totalScore = 0;
          this.resultTypes[key].percentage = 0;
        });
        // 滚动到页面顶部
        window.scrollTo({ top: 0, behavior: 'smooth' });
        return;
      }




      // 检查是否所有行都已选择
      const isAdvantageComplete = !this.advantageAnswers.some(answer => !answer);
      const isDisadvantageComplete = !this.disadvantageAnswers.some(answer => !answer);

      if (!isAdvantageComplete || !isDisadvantageComplete) {
        this.$message.warning('请完成所有行的选择！');
        return;
      }

      // 记录选择的选项ID（存储整数）
      this.selectedOptionIds = [];

      // 记录优点部分选择的ID
      this.advantageAnswers.forEach((answer, index) => {
        if (answer) {
          const category = answer.charAt(0);
          let optionId;

          switch(category) {
            case 's':
              optionId = index * 4 + 1;
              break;
            case 'c':
              optionId = index * 4 + 2;
              break;
            case 'm':
              optionId = index * 4 + 3;
              break;
            case 'p':
              optionId = index * 4 + 4;
              break;
          }

          // 直接存储整数ID
          this.selectedOptionIds.push(optionId);
        }
      });

      // 记录缺点部分选择的ID
      this.disadvantageAnswers.forEach((answer, index) => {
        if (answer) {
          const category = answer.charAt(0);
          let optionId;

          switch(category) {
            case 's':
              optionId = 80 + index * 4 + 1;
              break;
            case 'c':
              optionId = 80 + index * 4 + 2;
              break;
            case 'm':
              optionId = 80 + index * 4 + 3;
              break;
            case 'p':
              optionId = 80 + index * 4 + 4;
              break;
          }

          // 直接存储整数ID
          this.selectedOptionIds.push(optionId);

        }
      });

      // 打印选择的ID（实际应用中可以发送到服务器）
      console.log('选择的选项ID:', this.selectedOptionIds);
      const userId = parseInt(localStorage.getItem("userId"));

      addOptionRecord({
        userId: userId,
        selectedOptionIds: this.selectedOptionIds
      }).then(response => {
        // this.postList = response.rows;
        if(response.code === 200){
          console.log("提交成功")
          this.isLoading = true;

          // 模拟提交过程
          setTimeout(() => {
            // 统计各类别的选择数量
            this.calculateScores();
            // alert("插入数据库")
            //插入数据库
            const scores={
              userId: userId,
              typeSScore: this.resultTypes.s.totalScore,
              typeCScore: this.resultTypes.c.totalScore,
              typeMScore: this.resultTypes.m.totalScore,
              typePScore: this.resultTypes.p.totalScore
            };
            //保存四个得分
            addPersonalityResult(scores).then(response => {

            })


            // 显示结果
            this.showResults = true;
            this.isLoading = false;

            // 滚动到结果区域
            this.$nextTick(() => {
              const resultsCard = document.querySelector('.el-card:nth-child(3)');
              if (resultsCard) {
                resultsCard.scrollIntoView({ behavior: 'smooth', block: 'start' });
              }
            });
          }, 800);

        }

      })



    },

    // 计算各类别得分
    calculateScores() {
      // 重置得分
      Object.keys(this.resultTypes).forEach(key => {
        this.resultTypes[key].advantageScore = 0;
        this.resultTypes[key].disadvantageScore = 0;
        this.resultTypes[key].totalScore = 0;
        this.resultTypes[key].percentage = 0;
      });

      // 统计优点得分
      this.advantageAnswers.forEach(answer => {
        if (answer) {
          const category = answer.charAt(0);
          this.resultTypes[category].advantageScore += 1; // 优点每项2分
        }
      });

      // 统计缺点得分
      this.disadvantageAnswers.forEach(answer => {
        if (answer) {
          const category = answer.charAt(0);
          this.resultTypes[category].disadvantageScore += 1; // 缺点每项减1分
        }
      });

      // 计算总分和百分比
      const totalPossibleScore = 40; // 20题 * 2分
      Object.keys(this.resultTypes).forEach(key => {
        // 计算总分
        this.resultTypes[key].totalScore =
          this.resultTypes[key].advantageScore +
          this.resultTypes[key].disadvantageScore;

        //

        // 计算百分比（确保不小于0）
        const scoreForPercentage = Math.max(0, this.resultTypes[key].totalScore);
        this.resultTypes[key].percentage = Math.round((scoreForPercentage / totalPossibleScore) * 100);
      });
    }
  }
}
</script>

<style scoped>
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}
.test-title {
  text-align: center;
  margin-bottom: 30px;
}
.test-title h1 {
  color: #303133;
  font-size: 24px;
  margin-bottom: 10px;
}
.test-title p {
  color: #606266;
  font-size: 14px;
}
.card-header {
  font-size: 18px;
  font-weight: bold;
}
.category-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 15px;
  padding: 0 10px;
}
.category-header .el-col {
  font-weight: bold;
}
.option-row {
  margin-bottom: 15px;
  padding: 10px 0;
  border-bottom: 1px solid #ebeef5;
}
/* 增加选项悬停效果 */
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
.s-category { color: #f56c6c; }
.c-category { color: #409eff; }
.m-category { color: #e6a23c; }
.p-category { color: #909399; }

/* 结果卡片样式 */
.type-card {
  text-align: center;
  padding: 15px;
}
.type-header {
  font-size: 16px;
  margin-bottom: 10px;
}
.type-header i {
  margin-right: 5px;
}
.type-scores {
  margin-bottom: 10px;
  text-align: left;
}
.score-item {
  margin-bottom: 6px;
  font-size: 14px;
}
.score-label {
  display: inline-block;
  width: 60px;
  color: #606266;
}
.score-value {
  font-weight: bold;
}
.advantage .score-value {
  color: #67c23a; /* 优点分用绿色 */
}
.disadvantage .score-value {
  color: #f56c6c; /* 缺点分用红色 */
}
.total .score-value {
  color: #409eff; /* 总分用蓝色 */
  font-size: 16px;
}
.s-type { border-left: 3px solid #f56c6c; }
.c-type { border-left: 3px solid #409eff; }
.m-type { border-left: 3px solid #e6a23c; }
.p-type { border-left: 3px solid #909399; }

.type-progress {
  margin-top: 10px;
}
.personality-analysis {
  padding: 15px;
  background-color: #f9fafc;
  border-radius: 4px;
}
.personality-analysis h3 {
  margin-bottom: 10px;
}

/* 自定义tooltip样式 */
::v-deep .el-tooltip__popper {
  max-width: 200px;
  padding: 8px 12px;
  font-size: 13px;
}
</style>
