<template>
  <div class="app-container mbti-result">
    <el-card v-if="loading" shadow="never"><el-skeleton :rows="8" animated /></el-card>

    <template v-if="!loading && result">
      <!-- 类型主体 -->
      <el-card shadow="never" class="type-card" :style="{ borderTop: '4px solid ' + typeColor }">
        <div class="type-head">
          <div class="type-code" :style="{ background: typeColor }">{{ result.resultType }}</div>
          <div class="type-meta">
            <h2>{{ result.type ? result.type.typeName : result.resultType }}
              <span class="nick">{{ result.type ? result.type.nickName : '' }}</span>
            </h2>
            <p class="group">{{ result.type ? result.type.groupName : '' }}</p>
            <p class="summary">{{ result.type ? result.type.summary : '' }}</p>
            <p class="test-info">
              测试人：{{ result.userName || '匿名用户' }} ·
              用时：{{ durationText }} ·
              时间：{{ parseTime(result.testTime) }}
            </p>
          </div>
        </div>
      </el-card>

      <!-- 维度得分 -->
      <el-card shadow="never" class="dim-card">
        <div slot="header" class="card-header"><span>四维度倾向</span></div>
        <div v-for="dim in result.dimensions" :key="dim.dimension" class="dim-row">
          <div class="dim-name">{{ dim.dimensionName }}</div>
          <div class="dim-bar">
            <div class="dim-labels">
              <span :class="{ win: dim.dominant === dim.leftPole }">{{ dim.leftLabel }} {{ dim.leftPole }} · {{ dim.leftScore }} 分 · {{ dim.leftPercent }}%</span>
              <span :class="{ win: dim.dominant === dim.rightPole }">{{ dim.rightPercent }}% · {{ dim.rightScore }} 分 · {{ dim.rightPole }} {{ dim.rightLabel }}</span>
            </div>
            <div class="bar-track">
              <div class="bar-fill" :style="{ width: dim.leftPercent + '%', background: typeColor }"></div>
            </div>
          </div>
        </div>
      </el-card>

      <!-- 类型解读 -->
      <el-row :gutter="14" v-if="result.type">
        <el-col :span="12">
          <el-card shadow="never" class="text-card">
            <div slot="header" class="card-header"><span>性格解读</span></div>
            <p class="para">{{ result.type.description }}</p>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card shadow="never" class="text-card">
            <div slot="header" class="card-header"><span>你的优势</span></div>
            <el-tag v-for="(item, i) in splitText(result.type.strengths)" :key="'s' + i" type="success" effect="plain" class="tag-item">{{ item }}</el-tag>
            <div class="sub-title">需要留意</div>
            <el-tag v-for="(item, i) in splitText(result.type.weaknesses)" :key="'w' + i" type="warning" effect="plain" class="tag-item">{{ item }}</el-tag>
          </el-card>
        </el-col>
      </el-row>

      <el-row :gutter="14" v-if="result.type">
        <el-col :span="12">
          <el-card shadow="never" class="text-card">
            <div slot="header" class="card-header"><span>适合的职业方向</span></div>
            <el-tag v-for="(item, i) in splitText(result.type.careers)" :key="'c' + i" effect="plain" class="tag-item">{{ item }}</el-tag>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card shadow="never" class="text-card">
            <div slot="header" class="card-header"><span>人际关系与代表人物</span></div>
            <p class="para">{{ result.type.relationships }}</p>
            <p class="para small">代表人物：{{ result.type.famous }}</p>
          </el-card>
        </el-col>
      </el-row>

      <div class="actions">
        <el-button type="primary" icon="el-icon-refresh" @click="$router.push('/mbti/test')">重新测试</el-button>
        <el-button icon="el-icon-star-off" @click="$router.push('/mbti/type')">查看十六型人格</el-button>
        <el-button type="text" @click="$router.push('/mbti/record')">测试记录</el-button>
      </div>
    </template>

    <el-card v-if="!loading && !result" shadow="never" class="empty-card">
      <el-empty description="暂无测试结果，先做一次测试吧">
        <el-button type="primary" @click="$router.push('/mbti/test')">开始测试</el-button>
      </el-empty>
    </el-card>
  </div>
</template>

<script>
import { getMbtiResult, getMyMbtiRecords } from '@/api/mbti'

export default {
  name: 'MbtiResult',
  data() {
    return {
      loading: false,
      result: null
    }
  },
  computed: {
    typeColor() {
      return (this.result && this.result.type && this.result.type.color) || '#409eff'
    },
    durationText() {
      const sec = (this.result && this.result.duration) || 0
      if (!sec) return '--'
      const m = Math.floor(sec / 60)
      const s = sec % 60
      return (m > 0 ? m + ' 分 ' : '') + s + ' 秒'
    }
  },
  created() {
    this.load()
  },
  methods: {
    load() {
      const id = this.$route.query.id
      this.loading = true
      if (id) {
        getMbtiResult(id).then(res => {
          this.result = res.data
          this.loading = false
        }).catch(() => { this.loading = false })
      } else {
        getMyMbtiRecords().then(res => {
          const list = (res.data && res.data.data) || []
          if (list.length > 0) {
            return getMbtiResult(list[0].recordId).then(r => {
              this.result = r.data
              this.loading = false
            })
          }
          this.loading = false
        }).catch(() => { this.loading = false })
      }
    },
    splitText(text) {
      if (!text) return []
      return text.split(/[；;、]/).map(s => s.trim()).filter(s => s)
    }
  }
}
</script>

<style scoped>
.mbti-result .type-card { margin-bottom: 14px; }
.type-head { display: flex; gap: 22px; align-items: center; }
.type-code { width: 110px; height: 110px; border-radius: 16px; color: #fff; font-size: 26px; font-weight: 700; letter-spacing: 1px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
.type-meta h2 { margin: 0 0 4px; font-size: 22px; }
.type-meta .nick { font-size: 13px; color: #a8abb2; font-weight: 400; margin-left: 8px; }
.type-meta .group { margin: 0 0 8px; color: #909399; font-size: 13px; }
.type-meta .summary { margin: 0 0 8px; color: #606266; font-size: 14px; }
.type-meta .test-info { margin: 0; color: #a8abb2; font-size: 12px; }
.dim-card { margin-bottom: 14px; }
.dim-row { display: flex; gap: 16px; padding: 12px 0; border-bottom: 1px dashed #ebeef5; }
.dim-row:last-child { border-bottom: none; }
.dim-name { width: 80px; color: #606266; font-size: 13px; flex-shrink: 0; padding-top: 2px; }
.dim-bar { flex: 1; }
.dim-labels { display: flex; justify-content: space-between; font-size: 12px; color: #a8abb2; margin-bottom: 6px; }
.dim-labels .win { color: #303133; font-weight: 600; }
.bar-track { height: 10px; border-radius: 6px; background: #f2f3f5; overflow: hidden; display: flex; }
.bar-fill { height: 100%; transition: width .4s; }
.card-header { font-weight: 600; color: #303133; }
.text-card { margin-bottom: 14px; }
.para { margin: 0 0 10px; color: #606266; font-size: 13px; line-height: 1.8; }
.para.small { color: #909399; font-size: 12px; }
.sub-title { margin: 14px 0 8px; color: #909399; font-size: 12px; }
.tag-item { margin: 0 8px 8px 0; }
.actions { text-align: center; margin-top: 10px; }
.empty-card { margin-top: 40px; }
</style>
