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
      
        <!-- 优点选项行 -->
      <div v-for="(row, index) in advantageRows" :key="index" class="option-row" style="margin-bottom: 10px;">
  <!-- 题号 -->
          <span style="font-weight: bold; margin-right: 10px;">{{ index + 1 }}.</span>

          <!-- 单题选项（横向排列 + 间距） -->
          <el-radio-group v-model="advantageAnswers[index]" style="display: inline-block;">
            <el-tooltip
              placement="top"
              :content="advantageTooltips.advantage[index].soption"
              effect="light"
            >
              <el-radio :label="'s-' + index" class="radio-spaced">{{ row.soption }}</el-radio>
            </el-tooltip>

            <el-tooltip
              placement="top"
              :content="advantageTooltips.advantage[index].coption"
              effect="light"
            >
              <el-radio :label="'c-' + index" class="radio-spaced">{{ row.coption }}</el-radio>
            </el-tooltip>

            <el-tooltip
              placement="top"
              :content="advantageTooltips.advantage[index].moption"
              effect="light"
            >
              <el-radio :label="'m-' + index" class="radio-spaced">{{ row.moption }}</el-radio>
            </el-tooltip>

            <el-tooltip
              placement="top"
              :content="advantageTooltips.advantage[index].poption"
              effect="light"
            >
              <el-radio :label="'p-' + index" class="radio-spaced">{{ row.poption }}</el-radio>
            </el-tooltip>
          </el-radio-group>
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
       
        <!-- 缺点选项行 -->
        <div v-for="(row, index) in disadvantageRows" :key="index" class="option-row" style="margin-bottom: 10px;">
           <span style="font-weight: bold; margin-right: 10px;">{{ index + 1 }}.</span>
              <el-radio-group v-model="disadvantageAnswers[index]" style="display: inline-block;">
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].soption"
                  effect="light"
                >
                  <el-radio
                    :label="'s-' + index"
                    class="radio-spaced"
                  >{{ row.soption }}</el-radio>
                </el-tooltip>
              
        
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].coption"
                  effect="light"
                >
                  <el-radio
                    :label="'c-' + index"
                    class="radio-spaced"
                  >{{ row.coption }}</el-radio>
                </el-tooltip>
          
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].moption"
                  effect="light"
                >
                  <el-radio
                    :label="'m-' + index"
                    class="radio-spaced"
                
                  >{{ row.moption }}</el-radio>
                </el-tooltip>
  
                <el-tooltip
                  placement="top"
                  :content="advantageTooltips.disadvantage[index].poption"
                  effect="light"
                >
                  <el-radio
                    :label="'p-' + index"
                    class="radio-spaced"
                  >{{ row.poption }}</el-radio>
                </el-tooltip>
              </el-radio-group>
           
          
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
          <p v-for="type in dominantType()" :key="type">
          {{ analysisTexts[type] }}
        </p>

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
      advantageRows: [],

      // 缺点选项数据
      disadvantageRows: [],

      // 选项解释（鼠标悬停时显示）
      advantageTooltips: {
        advantage: [],
        disadvantage: []
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
        s: '您的性格类型主要是活泼型(S)，外向、多言且乐观。在情感方面，您予人好感，健谈风趣，是聚会的灵魂人物，总能用幽默感唤起美好的回忆，还能自如地控制听众，情绪与感情外露，热情洋溢且好表现，常常显得高兴、得意洋洋，对事物充满好奇，如同舞台上的人才般耀眼，您天真无邪又不失现实，性情虽善变却诚挚，带有些孩子气；作为父母，您能给家庭带来欢乐，深受孩子朋友的喜爱，擅长以苦为乐，把家庭氛围营造得像马戏团团长带动氛围一样活跃；对待工作时，您积极主动，勇于找寻新事务，虽然有时注重表面，但富有创造性，能让工作变得多姿多彩，充满干劲与积极性，做事如闪电般开始，还会鼓励他人参与，吸引他人一起工作；作为朋友，您容易结交，热爱身边的人，喜欢赞扬他人，总是看似兴奋，令人羡慕，与人相处不怀恨在心，犯错后会很快道歉，为了避免沉闷，您热衷于参与即兴的活动。',
        m: '您的性格类型主要是完美型(M),内向、爱思考且偏悲观。在情感方面，您深思熟虑、善于分析，为人严肃且有目标，天赋异禀，富有创造能力，对音乐艺术有敏锐感知，冷静又富有诗意，始终追求完美，对他人反应敏感，愿意自我牺牲，富有责任心，秉持理想主义；作为父母，您为孩子订立高标准，希望一切都能做到尽善尽美，将家里打理得井井有条，会帮孩子收拾，愿意为他人牺牲，并且会鼓励孩子争取奖学金、发挥自身才华；对待工作时，您习惯预先作计划，是个完美主义者，对自己和工作都有高标准，注重细节，做事善始善终，有条理有组织，爱整洁，讲求经济效益，善于发现问题，还能创造性地解决问题，生活和工作中都很勤俭节约，善于运用图表、数据、目录来分析问题；作为朋友，您交友谨慎，甘愿留在幕后，避免引起注意，对朋友忠诚可靠，会聆听抱怨并帮助解决他人的问题，很关心他人，情感丰富且易受感动，一直在寻求理想伴侣。',
        c: '您的性格类型主要是力量型(C),外向、是行动者且乐观。在情感方面，您是天生的领导者，活力充沛且积极主动，迫切希望改变现状，追求完美不容有错，意志坚决、行事果断，能够做到非情绪化，不会轻易气馁，自立自足，充满自信，仿佛有能力运作一切；作为父母，您会行使领导权，为家庭设定目标，促动家人行动，觉得自己知道正确答案，并负责管理家务；对待工作时，您目标主导，能够纵观全局，善于管理，寻求实际的解决方法，行动迅速，懂得委派工作，能坚持生产，会设定目标并促成行动，遇到挫折越挫越奋；作为朋友，您不大需要朋友，更倾向于为团体而工作，在团体中会领导及组织大家，总觉得自己是正确的，并且善于应变。',
        p: '您的性格类型主要是和平型(P),内向、是旁观者且偏悲观。在情感方面，您性格低调，易相处、轻松，平静、镇静、泰然自若，有耐心、易适应，习惯一成不变的生活，平静但诙谐，仁慈善良，会隐藏内心的情绪，乐天知命，面面俱备；作为父母，您是好父母，愿意为孩子花时间，不急躁，宽容，不易生气；对待工作时，您熟悉可靠，平和无异议，有行政能力，善于调解问题，会主动避免冲突，善于面对压力，倾向于寻求容易的解决方法；作为朋友，您容易相处，总是开心愉快，无攻击性，是好的聆听者，有着尖刻的幽默，喜欢旁观，有很多朋友，对人同情、关心。'
      }
    }
  },

  created() {
    this.getList()
 
  },

  methods: {
    dominantType() {
      const socres = Object.values(this.resultTypes).map(item => item.totalScore);
      const maxScore = Math.max(...socres);

      if (maxScore === 0) return null;

      const dominantTypes = Object.keys(this.resultTypes).filter(
        key => this.resultTypes[key].totalScore === maxScore
      );

      return dominantTypes;// 返回所有并列最高得分的类型
    },


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
          this.resultTypes[category].disadvantageScore += 1; // 缺点每项加1分
        }
      });

      // 计算总分和百分比
      const totalPossibleScore = 40; // 20题 * 2分
      Object.keys(this.resultTypes).forEach(key => {
        // 计算总分
        this.resultTypes[key].totalScore =
          this.resultTypes[key].advantageScore +
          this.resultTypes[key].disadvantageScore;
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

.card-header {
  font-size: 18px;
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
.radio-spaced {
  margin-right: 100px;
  min-width: 100px;
  margin-bottom: 6px;
}
/* 自定义tooltip样式 */
::v-deep .el-tooltip__popper {
  max-width: 200px;
  padding: 8px 12px;
  font-size: 13px;
}
</style>
