<template>
  <div class="app-container mbti-test">
    <!-- 顶部说明 -->
    <el-card class="intro-card" shadow="never">
      <div class="intro-head">
        <div>
          <h2>MBTI 人格测试</h2>
          <p class="intro-desc">
            共 {{ total }} 题，每题请选择更符合你的一项。凭第一感觉作答即可，没有对错之分。
          </p>
        </div>
        <div class="intro-meta">
          <div class="meta-item"><span class="label">已答</span><span class="value">{{ answeredCount }}/{{ total }}</span></div>
          <div class="meta-item"><span class="label">用时</span><span class="value">{{ elapsedText }}</span></div>
        </div>
      </div>
      <el-progress :percentage="progress" :stroke-width="8" :show-text="false" class="intro-progress" />
      <p class="page-info">第 {{ page }} / {{ totalPages }} 页</p>
    </el-card>

    <!-- 题目 -->
    <el-card v-loading="loading" shadow="never" class="question-card">
      <div v-for="(q, index) in pageQuestions" :key="q.questionId" class="question-item">
        <div class="question-title">
          <span class="q-no">{{ (page - 1) * pageSize + index + 1 }}</span>
          <span class="q-text">请选择更符合你的一项</span>
          <el-tag v-if="answers[q.questionId]" size="mini" type="success" effect="plain">已选</el-tag>
        </div>
        <div class="options">
          <div
            class="option"
            :class="{ active: answers[q.questionId] === 'A' }"
            @click="choose(q, 'A')"
          >
            <span class="opt-key">A</span>
            <span class="opt-text">{{ q.optionA }}</span>
          </div>
          <div
            class="option"
            :class="{ active: answers[q.questionId] === 'B' }"
            @click="choose(q, 'B')"
          >
            <span class="opt-key">B</span>
            <span class="opt-text">{{ q.optionB }}</span>
          </div>
        </div>
      </div>
      <el-empty v-if="!loading && pageQuestions.length === 0" description="题库为空，请先联系管理员维护题目" />
    </el-card>

    <!-- 翻页 / 提交 -->
    <div class="actions">
      <el-button icon="el-icon-arrow-left" @click="prevPage" :disabled="page === 1">上一页</el-button>
      <el-button type="primary" icon="el-icon-arrow-right" v-if="page < totalPages" @click="nextPage">下一页</el-button>
      <el-button type="success" icon="el-icon-check" :loading="submitting" v-else @click="submit">提交答卷</el-button>
      <el-button type="text" @click="resetAll">重新开始</el-button>
    </div>
  </div>
</template>

<script>
import { getMbtiQuestions, submitMbtiAnswers } from '@/api/mbti'

export default {
  name: 'MbtiTest',
  data() {
    return {
      loading: false,
      submitting: false,
      questions: [],
      answers: {},
      page: 1,
      pageSize: 10,
      startTime: 0,
      now: Date.now(),
      timer: null
    }
  },
  computed: {
    total() {
      return this.questions.length
    },
    totalPages() {
      return Math.max(1, Math.ceil(this.total / this.pageSize))
    },
    pageQuestions() {
      const start = (this.page - 1) * this.pageSize
      return this.questions.slice(start, start + this.pageSize)
    },
    answeredCount() {
      return Object.keys(this.answers).length
    },
    progress() {
      if (!this.total) return 0
      return Math.round((this.answeredCount / this.total) * 100)
    },
    elapsedText() {
      if (!this.startTime) return '00:00'
      const sec = Math.max(0, Math.floor((this.now - this.startTime) / 1000))
      const m = String(Math.floor(sec / 60)).padStart(2, '0')
      const s = String(sec % 60).padStart(2, '0')
      return m + ':' + s
    }
  },
  created() {
    this.getList()
  },
  beforeDestroy() {
    if (this.timer) clearInterval(this.timer)
  },
  methods: {
    getList() {
      this.loading = true
      getMbtiQuestions().then(res => {
        this.questions = res.data || []
        this.startTime = Date.now()
        this.now = Date.now()
        this.timer = setInterval(() => {
          this.now = Date.now()
        }, 1000)
        this.loading = false
      }).catch(() => {
        this.loading = false
      })
    },
    choose(q, choice) {
      this.$set(this.answers, q.questionId, choice)
    },
    checkPageComplete() {
      const missing = this.pageQuestions.filter(q => !this.answers[q.questionId])
      if (missing.length > 0) {
        this.$message.warning('本页还有 ' + missing.length + ' 题未作答，请完成后继续')
        return false
      }
      return true
    },
    prevPage() {
      if (this.page > 1) this.page--
    },
    nextPage() {
      if (!this.checkPageComplete()) return
      if (this.page < this.totalPages) this.page++
    },
    submit() {
      if (!this.checkPageComplete()) return
      const unanswered = this.questions.filter(q => !this.answers[q.questionId])
      if (unanswered.length > 0) {
        this.$message.warning('还有 ' + unanswered.length + ' 题未作答')
        return
      }
      const payload = {
        duration: this.startTime ? Math.floor((Date.now() - this.startTime) / 1000) : 0,
        answers: this.questions.map(q => ({ questionId: q.questionId, choice: this.answers[q.questionId] }))
      }
      this.submitting = true
      submitMbtiAnswers(payload).then(res => {
        this.submitting = false
        const recordId = res.data && res.data.recordId
        this.$message.success('提交成功，正在生成你的结果')
        this.$router.push({ path: '/mbti/result', query: { id: recordId } })
      }).catch(() => {
        this.submitting = false
      })
    },
    resetAll() {
      this.answers = {}
      this.page = 1
      this.startTime = Date.now()
      this.$message.info('已重置，可重新作答')
    }
  }
}
</script>

<style scoped>
.mbti-test .intro-card { margin-bottom: 14px; }
.intro-head { display: flex; justify-content: space-between; align-items: flex-start; }
.intro-head h2 { margin: 0 0 6px; font-size: 20px; }
.intro-desc { margin: 0; color: #7d8396; font-size: 13px; line-height: 1.6; }
.intro-meta { display: flex; gap: 22px; }
.intro-meta .label { color: #99a1b3; font-size: 12px; margin-right: 6px; }
.intro-meta .value { font-size: 16px; font-weight: 600; color: #303133; }
.intro-progress { margin-top: 14px; }
.page-info { margin: 8px 0 0; font-size: 12px; color: #909399; }
.question-item { padding: 14px 0; border-bottom: 1px dashed #ebeef5; }
.question-item:last-child { border-bottom: none; }
.question-title { display: flex; align-items: center; gap: 10px; margin-bottom: 10px; }
.q-no { width: 24px; height: 24px; border-radius: 50%; background: #ecf5ff; color: #409eff; font-size: 12px; display: inline-flex; align-items: center; justify-content: center; }
.q-text { color: #606266; font-size: 13px; }
.options { display: flex; flex-direction: column; gap: 10px; }
.option { display: flex; align-items: center; gap: 12px; padding: 12px 14px; border: 1px solid #e4e7ed; border-radius: 8px; cursor: pointer; transition: all .18s; }
.option:hover { border-color: #a0cfff; background: #f5f9ff; }
.option.active { border-color: #409eff; background: #ecf5ff; box-shadow: 0 2px 8px rgba(64, 158, 255, .12); }
.opt-key { width: 22px; height: 22px; border-radius: 50%; background: #f2f3f5; color: #909399; font-size: 12px; display: inline-flex; align-items: center; justify-content: center; flex-shrink: 0; }
.option.active .opt-key { background: #409eff; color: #fff; }
.opt-text { color: #303133; font-size: 14px; line-height: 1.5; }
.actions { margin-top: 16px; text-align: center; }
</style>
