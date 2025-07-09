<template>
  <div class="score-wrapper">
    <el-card class="score-card" shadow="hover">
      <h2>原型人格得分结果</h2>

      <!-- 表格展示 -->
      <div class="score-grid">
        <el-table :data="leftScores" stripe border :show-header="false" class="score-table">
          <el-table-column prop="name" label="原型" align="center"></el-table-column>
          <el-table-column prop="score" label="得分" width="80" align="center"></el-table-column>
        </el-table>

        <el-table :data="rightScores" stripe border :show-header="false" class="score-table">
          <el-table-column prop="name" label="原型" align="center"></el-table-column>
          <el-table-column prop="score" label="得分" width="80" align="center"></el-table-column>
        </el-table>
      </div>

      <!-- 饼状图 -->
      <div class="chart-container">
        <div ref="pieChart" class="chart"></div>
      </div>
      <!-- 柱状图 -->
       <div class="chart-container">
         <div ref="barChart" class="bar-chart"></div>
       </div>
    </el-card>

    <!-- 返回首页按钮 -->
    <el-button type="primary" @click="goToHome" class="back-home-button">返回首页</el-button>
  </div>

</template>

<script>
import { listPost, getPost, delPost } from "@/api/system/post"
import {getPersonalityScores} from "@/api/questions/topic"
import * as echarts from 'echarts';

export default {
  name: 'ArchetypeScoreDisplay',
  data() {
    return {
      scores: [],
      chartInstance: null,
      barChartInstance: null,
      recordId: null,
      userId: null,
      total: 0,
      // 结果表格数据
      postList: [],
      // 加载状态
      loading: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,
      },
    };
  },
  computed: {
    sortedScores() {
      return this.scores.slice().sort((a, b) => b.score - a.score);
    },
    leftScores() {
      return this.sortedScores.slice(0, 6);
    },
    rightScores() {
      return this.sortedScores.slice(6, 12);
    }
  },
  created() {
    // 从路由查询参数中获取recordId和userId
    // this.recordId = this.$route.query.recordId;
    this.recordId = parseInt(localStorage.getItem("recordId"));
    this.userId = this.$route.query.userId;
    console.log("打印record：",this.recordId,this.userId)
    // 如果recordId存在，则加载评分数据
    if (this.recordId) {
      this.getPersonalityScores();
    }else{
      this.$message.error('请先完成答题');
      this.$router.push('/questions');
    }
  },
  mounted() {
    this.$nextTick(() => {
      // this.initChart();
      window.addEventListener("resize", () => {
        if (this.chartInstance) this.chartInstance.resize();
        if (this.barChartInstance) this.barChartInstance.resize();
      });
    });
  },
  methods: {
    initChart() {
      this.chartInstance = echarts.init(this.$refs.pieChart);
      const option = {
        title: {
          text: '原型人格得分比例',
          left: 'center',
          top: '10%'
        },
        tooltip: {
          trigger: 'item',
          formatter: '{b}: {c} 分 ({d}%)'
        },
        legend: {
          orient: 'vertical',
          left: 'left',
          data: this.scores.map(s => s.name)
        },
        series: [
          {
            name: '原型得分',
            type: 'pie',
            radius: '60%',
            top: '10%',
            center: ['50%', '50%'],
            data: this.scores.map(s => ({ name: s.name, value: s.score })),
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: 'rgba(0, 0, 0, 0.5)'
              }
            }
          }
        ]
      };
      this.chartInstance.setOption(option);
      // 绘制柱状图
      this.barChartInstance = echarts.init(this.$refs.barChart);
      const barOption = {
        title: {
          text: '原型人格得分柱状图',
          left: 'center',
        },
        tooltip:{
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'}
          },
        xAxis: {
          type: 'category',
          data: this.scores.map(s => s.name),
          axisLabel: {
            interval: 0,
            rotate: 30
          }
        },
        yAxis: {
          type: 'value',
          name: '得分'
        },
        series: [{
          data: this.scores.map(s => s.score),
          type: 'bar',
          barWidth: '50%',
          itemStyle:{
            color:'#409eff' 
          }
        }],
      };
      this.barChartInstance.setOption(barOption);
    },
    /** 更新饼状图数据 */
    updateChart() {
      if (this.chartInstance && this.scores.length > 0) {
        const scoreData = this.scores.map(score => ({
          value: score.score,
          name: score.name
        }));

        // 更新图表配置
        const option = {
          series: [
            {
              data: scoreData
            }
          ]
        };

        // 使用新配置更新图表
        this.chartInstance.setOption(option);
      }
    },

        /** 更新柱状图数据 */
    updateBarChart() {
      if (this.barChartInstance && this.scores.length > 0) {
        const scoreData = this.scores.map(score => ({
          value: score.score,
          name: score.name
        }));

        // 更新图表配置
        const option = {
          series: [
            {
              data: scoreData
            }
          ]
        };

        // 使用新配置更新图表
        this.barChartInstance.setOption(option);
      }
    },

    /** 获取人格评分数据 */
    getPersonalityScores() {
      // 调用API获取评分数据
      this.loading = true;

      // 使用新定义的API方法
      getPersonalityScores(this.recordId, this.userId).then(response => {
        // 假设返回的数据结构为 { scores: [...] }
        console.log("打印评分数据：",response.data.scores)
        if (response && response.data.scores) {
          this.scores = response.data.scores;
          // 初始化图表
          this.$nextTick(() => {
            this.initChart();
            //更新柱状图
            this.updateBarChart();
            // 更新饼状图
          this.updateChart();
          });
          
        } else {
          this.$message.error('未能获取到评分数据');

        }

        this.loading = false;
      }).catch(() => {
        this.$message.error('获取评分数据失败');
        this.loading = false;
      });
    },
    /** 查询列表 */
    getList() {
      this.loading = true
      listPost(this.queryParams).then(response => {
        this.postList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 返回首页方法
    goToHome() {
      this.$router.push({ path: '/' });
    }
  }

};
</script>

<style scoped>
.score-wrapper {
  padding: 20px;
}
.score-card {
  padding: 20px;
}
h2 {
  margin-bottom: 20px;
  text-align: center;
}
.score-grid {
  display: flex;
  justify-content: space-around;
  gap: 20px;
  margin-bottom: 30px;
}
.score-table {
  width: 45%;
}
.chart-container {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.chart {
  width: 600px;
  height: 400px;
}
.back-home-button {
  display: block;
  margin: 20px auto;
  text-align: center;
}
.bar-chart {
  width: 100%;
  max-width: 800px;
  height: 400px;
}
</style>
