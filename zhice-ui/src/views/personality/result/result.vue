<template>
  <div class="app-container">
    <h2>心理测试结果</h2>

    <!-- 加载状态 -->
    <el-card v-if="loading" class="loading-card">
      <el-skeleton :rows="6" animated />
    </el-card>

    <!-- 数据展示区域 -->
    <div v-if="hasData && !loading" class="result-content">
      <!-- 分数表格 -->
      <el-card class="score-table">
        <el-table :data="[scores]" border style="width: 100%">
          <el-table-column prop="typeSScore" label="活泼型 (S)" align="center"></el-table-column>
          <el-table-column prop="typeCScore" label="力量型 (C)" align="center"></el-table-column>
          <el-table-column prop="typeMScore" label="完美型 (M)" align="center"></el-table-column>
          <el-table-column prop="typePScore" label="和平型 (P)" align="center"></el-table-column>
        </el-table>
      </el-card>


      <!-- 饼图展示 -->
      <el-card class="chart-section">
        <div ref="pieChart" class="pie-chart"></div>
      </el-card>

      <!-- 最高分类型展示 -->
      <el-card class="traits-section">
        <h3>您的主要性格特质</h3>
        <div v-for="type in highestTypes" :key="type" class="trait-box">
          <h4>{{ typeLabel(type) }}</h4>
          <p>{{ typeDescriptions[type] }}</p>
        </div>
      </el-card>

      <!-- 返回按钮 -->
      <el-button type="primary" @click="$router.push('/personality/questions')">重新测试</el-button>
    </div>

    <!-- 无数据提示 -->
    <el-card v-if="!hasData && !loading" class="no-data">
      <p>目前无测试记录，请先完成心理测试。</p>
    </el-card>
  </div>
</template>

<script>
import * as echarts from 'echarts';
import { getLastPersonality } from "@/api/personality/personality";

export default {
  name: "PersonalityResult",

  data() {
    return {
      scores: null,
      loading: false,
      hasData: true,
      chartInstance: null,
      highestTypes: [],         // 存储得分最高的性格类型
      typeDescriptions: {}      // 存储不同类型对应的描述
    };
  },
  computed: {
    chartData() {
      if (!this.scores) return [];
      return [
        { name: '活泼型 (S)', score: this.scores.typeSScore || 0 },
        { name: '力量型 (C)', score: this.scores.typeCScore || 0 },
        { name: '完美型 (M)', score: this.scores.typeMScore || 0 },
        { name: '和平型 (P)', score: this.scores.typePScore || 0 }
      ];
    }
  },
  watch: {
    scores: {
      deep: true,
      handler(newVal) {
        if (newVal) {
          this.$nextTick(() => {
            this.initChart();
            this.findHighestTypes(); // 数据变化时更新最高分类型
          });
        }
      }
    }
  },
  created() {
    this.loadResults();
  },
  activated() {
    // 如果页面被 keep-alive 缓存，激活时刷新
    this.loadResults();
  },
  methods: {
    async loadResults() {
      const userId = localStorage.getItem('userId');

      if (!userId) {
        this.hasData = false;
        return;
      }
      if(this.loading) return;

      this.queryParams = { userId };

      try {
        this.loading = true;

        const response = await getLastPersonality(this.queryParams);

        this.scores = response.data;
        this.hasData = !!this.scores;
      } catch (error) {
        console.error("获取结果失败:", error.response || error);
        this.hasData = false;
        this.$message.error("无法加载测试结果");
      } finally {
        this.loading = false;
      }
    },
    initChart() {
      if (!this.scores || !this.$refs.pieChart) return;

      if (this.chartInstance) {
        this.chartInstance.dispose();
      }

      this.chartInstance = echarts.init(this.$refs.pieChart);

      this.chartInstance.setOption({
        title: {
          text: '人格类型分布',
          left: 'center'
        },
        tooltip: {
          trigger: 'item'
        },
        legend: {
          orient: 'vertical',
          left: 'left'
        },
        series: [{
          name: '分数',
          type: 'pie',
          radius: '50%',
          data: this.chartData.map(item => ({
            value: item.score,
            name: item.name
          })),
          emphasis: {
            itemStyle: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }]
      });
    },
    findHighestTypes() {
      if (!this.scores) {
        this.highestTypes = [];
        this.typeDescriptions = {};
        return;
      }

      const scoresMap = {
        S: this.scores.typeSScore || 0,
        C: this.scores.typeCScore || 0,
        M: this.scores.typeMScore || 0,
        P: this.scores.typePScore || 0
      };

      const maxScore = Math.max(...Object.values(scoresMap));
      this.highestTypes = Object.keys(scoresMap).filter(type => scoresMap[type] === maxScore);

      // 根据 index.vue 中的分析文本设置描述
      this.typeDescriptions = {
        S: '您的性格类型主要是活泼型(S)，外向、多言且乐观。在情感方面，您予人好感，健谈风趣，是聚会的灵魂人物，总能用幽默感唤起美好的回忆，还能自如地控制听众，情绪与感情外露，热情洋溢且好表现，常常显得高兴、得意洋洋，对事物充满好奇，如同舞台上的人才般耀眼，您天真无邪又不失现实，性情虽善变却诚挚，带有些孩子气；作为父母，您能给家庭带来欢乐，深受孩子朋友的喜爱，擅长以苦为乐，把家庭氛围营造得像马戏团团长带动氛围一样活跃；对待工作时，您积极主动，勇于找寻新事务，虽然有时注重表面，但富有创造性，能让工作变得多姿多彩，充满干劲与积极性，做事如闪电般开始，还会鼓励他人参与，吸引他人一起工作；作为朋友，您容易结交，热爱身边的人，喜欢赞扬他人，总是看似兴奋，令人羡慕，与人相处不怀恨在心，犯错后会很快道歉，为了避免沉闷，您热衷于参与即兴的活动。',
        M: '您的性格类型主要是完美型(M),内向、爱思考且偏悲观。在情感方面，您深思熟虑、善于分析，为人严肃且有目标，天赋异禀，富有创造能力，对音乐艺术有敏锐感知，冷静又富有诗意，始终追求完美，对他人反应敏感，愿意自我牺牲，富有责任心，秉持理想主义；作为父母，您为孩子订立高标准，希望一切都能做到尽善尽美，将家里打理得井井有条，会帮孩子收拾，愿意为他人牺牲，并且会鼓励孩子争取奖学金、发挥自身才华；对待工作时，您习惯预先作计划，是个完美主义者，对自己和工作都有高标准，注重细节，做事善始善终，有条理有组织，爱整洁，讲求经济效益，善于发现问题，还能创造性地解决问题，生活和工作中都很勤俭节约，善于运用图表、数据、目录来分析问题；作为朋友，您交友谨慎，甘愿留在幕后，避免引起注意，对朋友忠诚可靠，会聆听抱怨并帮助解决他人的问题，很关心他人，情感丰富且易受感动，一直在寻求理想伴侣。',
        C: '您的性格类型主要是力量型(C),外向、是行动者且乐观。在情感方面，您是天生的领导者，活力充沛且积极主动，迫切希望改变现状，追求完美不容有错，意志坚决、行事果断，能够做到非情绪化，不会轻易气馁，自立自足，充满自信，仿佛有能力运作一切；作为父母，您会行使领导权，为家庭设定目标，促动家人行动，觉得自己知道正确答案，并负责管理家务；对待工作时，您目标主导，能够纵观全局，善于管理，寻求实际的解决方法，行动迅速，懂得委派工作，能坚持生产，会设定目标并促成行动，遇到挫折越挫越奋；作为朋友，您不大需要朋友，更倾向于为团体而工作，在团体中会领导及组织大家，总觉得自己是正确的，并且善于应变。',
        P: '您的性格类型主要是和平型(P),内向、是旁观者且偏悲观。在情感方面，您性格低调，易相处、轻松，平静、镇静、泰然自若，有耐心、易适应，习惯一成不变的生活，平静但诙谐，仁慈善良，会隐藏内心的情绪，乐天知命，面面俱备；作为父母，您是好父母，愿意为孩子花时间，不急躁，宽容，不易生气；对待工作时，您熟悉可靠，平和无异议，有行政能力，善于调解问题，会主动避免冲突，善于面对压力，倾向于寻求容易的解决方法；作为朋友，您容易相处，总是开心愉快，无攻击性，是好的聆听者，有着尖刻的幽默，喜欢旁观，有很多朋友，对人同情、关心。'
      };
    },
    typeLabel(type) {
      const labels = {
        S: '活泼型 (S)',
        C: '力量型 (C)',
        M: '完美型 (M)',
        P: '和平型 (P)'
      };
      return labels[type] || type;
    }
  }
  // beforeDestroy() {
  //   if (this.chartInstance) {
  //     this.chartInstance.dispose();
  //   }
  // }
};
</script>

<style scoped>
.app-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 20px;
}

.result-content {
  margin-top: 20px;
  width: 100%;
}

.score-table {
  margin-bottom: 20px;
}

.chart-section {
  margin-bottom: 20px;
  text-align: center;
}

.pie-chart {
  width: 500px;
  height: 500px;
  margin: 0 auto;
}

.traits-section {
  margin-top: 20px;
  padding: 20px;
}

.trait-box {
  border: 1px solid #e4e4e4;
  padding: 15px;
  border-radius: 8px;
  margin-bottom: 15px;
}

.trait-box h4 {
  color: #1890ff;
  margin-bottom: 10px;
}

.no-data {
  text-align: center;
  color: #999;
  font-size: 16px;
  padding: 20px;
}

/* 加载卡片样式 */
.loading-card {
  text-align: center;
  padding: 30px 0;
}

/* 返回按钮样式优化 */
.el-button--primary {
  margin-top: 20px;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .pie-chart {
    width: 95%;
    height: 400px; /* 调整高度以适应手机屏幕 */
  }

  .chart-section {
    text-align: center;
    margin-bottom: 20px;
  }

  .traits-section {
    margin-top: 20px;
    padding: 20px;
  }
}
</style>
