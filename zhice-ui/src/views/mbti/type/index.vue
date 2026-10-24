<template>
  <div class="app-container mbti-type">
    <el-card shadow="never" class="filter-card">
      <div class="group-filter">
        <el-button
          size="small"
          :type="group === '' ? 'primary' : 'default'"
          @click="changeGroup('')"
        >全部</el-button>
        <el-button
          v-for="g in groups"
          :key="g"
          size="small"
          :type="group === g ? 'primary' : 'default'"
          @click="changeGroup(g)"
        >{{ g }}</el-button>
        <span class="total-tip">共 {{ list.length }} 种人格类型</span>
      </div>
    </el-card>

    <el-row :gutter="14" v-loading="loading">
      <el-col :span="6" v-for="item in filtered" :key="item.typeCode" class="type-col">
        <el-card shadow="hover" class="type-item" :style="{ borderTop: '3px solid ' + item.color }" @click.native="openDetail(item)">
          <div class="code" :style="{ color: item.color }">{{ item.typeCode }}</div>
          <div class="name">{{ item.typeName }}</div>
          <div class="nick">{{ item.nickName }}</div>
          <div class="group-tag">{{ item.groupName }}</div>
          <div class="summary">{{ item.summary }}</div>
        </el-card>
      </el-col>
    </el-row>

    <el-dialog :title="current.typeCode + ' · ' + current.typeName" :visible.sync="dialogVisible" width="680px" append-to-body>
      <div v-if="current.typeCode" class="detail">
        <p class="summary">{{ current.summary }}</p>
        <div class="block">
          <h4>性格解读</h4>
          <p>{{ current.description }}</p>
        </div>
        <el-row :gutter="16">
          <el-col :span="12">
            <div class="block">
              <h4>优势</h4>
              <el-tag v-for="(t, i) in splitText(current.strengths)" :key="'s' + i" type="success" effect="plain" size="small" class="tag">{{ t }}</el-tag>
            </div>
          </el-col>
          <el-col :span="12">
            <div class="block">
              <h4>劣势</h4>
              <el-tag v-for="(t, i) in splitText(current.weaknesses)" :key="'w' + i" type="warning" effect="plain" size="small" class="tag">{{ t }}</el-tag>
            </div>
          </el-col>
        </el-row>
        <div class="block">
          <h4>适合职业</h4>
          <el-tag v-for="(t, i) in splitText(current.careers)" :key="'c' + i" effect="plain" size="small" class="tag">{{ t }}</el-tag>
        </div>
        <div class="block">
          <h4>人际关系</h4>
          <p>{{ current.relationships }}</p>
        </div>
        <div class="block">
          <h4>代表人物</h4>
          <p>{{ current.famous }}</p>
        </div>
      </div>
      <span slot="footer">
        <el-button @click="dialogVisible = false">关闭</el-button>
        <el-button type="primary" @click="goTest">测一测我是哪型</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { listMbtiTypes } from '@/api/mbti'

export default {
  name: 'MbtiType',
  data() {
    return {
      loading: false,
      group: '',
      list: [],
      dialogVisible: false,
      current: {}
    }
  },
  computed: {
    groups() {
      const set = []
      this.list.forEach(item => {
        if (item.groupName && set.indexOf(item.groupName) === -1) set.push(item.groupName)
      })
      return set
    },
    filtered() {
      if (!this.group) return this.list
      return this.list.filter(item => item.groupName === this.group)
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.loading = true
      listMbtiTypes().then(res => {
        this.list = res.data || []
        this.loading = false
      }).catch(() => { this.loading = false })
    },
    changeGroup(g) {
      this.group = g
    },
    openDetail(item) {
      this.current = item
      this.dialogVisible = true
    },
    splitText(text) {
      if (!text) return []
      return text.split(/[；;、]/).map(s => s.trim()).filter(s => s)
    },
    goTest() {
      this.dialogVisible = false
      this.$router.push('/mbti/test')
    }
  }
}
</script>

<style scoped>
.filter-card { margin-bottom: 14px; }
.group-filter { display: flex; align-items: center; gap: 8px; flex-wrap: wrap; }
.total-tip { margin-left: auto; color: #a8abb2; font-size: 12px; }
.type-col { margin-bottom: 14px; }
.type-item { cursor: pointer; transition: transform .18s; height: 100%; }
.type-item:hover { transform: translateY(-2px); }
.code { font-size: 22px; font-weight: 700; letter-spacing: 1px; }
.name { font-size: 15px; color: #303133; margin-top: 4px; }
.nick { font-size: 12px; color: #a8abb2; }
.group-tag { display: inline-block; margin: 8px 0; padding: 2px 8px; border-radius: 10px; background: #f4f4f5; color: #909399; font-size: 12px; }
.summary { color: #606266; font-size: 13px; line-height: 1.6; }
.detail .block { margin-top: 16px; }
.detail h4 { margin: 0 0 8px; color: #303133; font-size: 14px; }
.detail p { margin: 0; color: #606266; font-size: 13px; line-height: 1.8; }
.tag { margin: 0 6px 6px 0; }
</style>
