<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="76px">
      <el-form-item label="测试人" prop="userName">
        <el-input v-model="queryParams.userName" placeholder="请输入测试人" clearable @keyup.enter.native="handleQuery" />
      </el-form-item>
      <el-form-item label="结果类型" prop="resultType">
        <el-select v-model="queryParams.resultType" placeholder="全部类型" clearable style="width: 130px">
          <el-option v-for="t in typeOptions" :key="t" :label="t" :value="t" />
        </el-select>
      </el-form-item>
      <el-form-item label="测试时间">
        <el-date-picker
          v-model="dateRange"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button type="primary" plain icon="el-icon-plus" size="mini" @click="$router.push('/mbti/test')">开始测试</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="danger" plain icon="el-icon-delete" size="mini" :disabled="multiple" @click="handleDelete">删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button type="warning" plain icon="el-icon-download" size="mini" @click="handleExport">导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="记录ID" prop="recordId" width="90" align="center" />
      <el-table-column label="测试人" prop="userName" align="center" :show-overflow-tooltip="true" />
      <el-table-column label="结果类型" align="center" width="110">
        <template slot-scope="scope">
          <el-tag size="mini" effect="dark">{{ scope.row.resultType }}</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="E/I" align="center" width="90">
        <template slot-scope="scope">{{ scope.row.scoreE }} / {{ scope.row.scoreI }}</template>
      </el-table-column>
      <el-table-column label="S/N" align="center" width="90">
        <template slot-scope="scope">{{ scope.row.scoreS }} / {{ scope.row.scoreN }}</template>
      </el-table-column>
      <el-table-column label="T/F" align="center" width="90">
        <template slot-scope="scope">{{ scope.row.scoreT }} / {{ scope.row.scoreF }}</template>
      </el-table-column>
      <el-table-column label="J/P" align="center" width="90">
        <template slot-scope="scope">{{ scope.row.scoreJ }} / {{ scope.row.scoreP }}</template>
      </el-table-column>
      <el-table-column label="用时" align="center" width="90">
        <template slot-scope="scope">{{ scope.row.duration ? scope.row.duration + ' 秒' : '--' }}</template>
      </el-table-column>
      <el-table-column label="测试时间" align="center" prop="testTime" width="160">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.testTime, '{y}-{m}-{d} {h}:{i}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button size="mini" type="text" icon="el-icon-view" @click="handleView(scope.row)">查看结果</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import { listMbtiRecords, delMbtiRecord } from '@/api/mbti'

export default {
  name: 'MbtiRecord',
  data() {
    return {
      loading: false,
      showSearch: true,
      recordList: [],
      total: 0,
      recordIds: [],
      multiple: true,
      dateRange: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,
        resultType: undefined
      },
      typeOptions: [
        'INTJ', 'INTP', 'ENTJ', 'ENTP',
        'INFJ', 'INFP', 'ENFJ', 'ENFP',
        'ISTJ', 'ISFJ', 'ESTJ', 'ESFJ',
        'ISTP', 'ISFP', 'ESTP', 'ESFP'
      ]
    }
  },
  created() {
    this.getList()
  },
  methods: {
    getList() {
      this.loading = true
      listMbtiRecords(this.addDateRange(this.queryParams, this.dateRange)).then(res => {
        this.recordList = res.rows || []
        this.total = res.total || 0
        this.loading = false
      }).catch(() => { this.loading = false })
    },
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    resetQuery() {
      this.dateRange = []
      this.resetForm('queryForm')
      this.handleQuery()
    },
    handleSelectionChange(selection) {
      this.recordIds = selection.map(item => item.recordId)
      this.multiple = !selection.length
    },
    handleView(row) {
      this.$router.push({ path: '/mbti/result', query: { id: row.recordId } })
    },
    handleDelete() {
      this.$confirm('确认删除选中的 ' + this.recordIds.length + ' 条测试记录？', '提示', { type: 'warning' }).then(() => {
        return delMbtiRecord(this.recordIds.join(','))
      }).then(() => {
        this.getList()
        this.$message.success('删除成功')
      }).catch(() => {})
    },
    handleExport() {
      this.download('/mbti/record/export', {
        ...this.queryParams
      }, 'mbti_' + new Date().getTime() + '.xlsx')
    }
  }
}
</script>
