<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">

      <el-form-item label="用户名称" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
         v-hasPermi="['questions:score:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户名" align="center" prop="userName" />
      <el-table-column label="天真者" align="center" prop="score1" />
      <el-table-column label="孤儿" align="center" prop="score2" />
      <el-table-column label="战士" align="center" prop="score3" />
      <el-table-column label="照顾者" align="center" prop="score4" />
      <el-table-column label="追寻者" align="center" prop="score5"/>
      <el-table-column label="爱人者" align="center" prop="score6"/>
      <el-table-column label="破坏者" align="center" prop="score7"/>
      <el-table-column label="创造者" align="center" prop="score8"/>
      <el-table-column label="魔术师" align="center" prop="score9"/>
      <el-table-column label="统治者" align="center" prop="score10"/>
      <el-table-column label="智者" align="center" prop="score11"/>
      <el-table-column label="愚者" align="center" prop="score12"/>
      <el-table-column label="创建时间" align="center" prop="submitTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.submitTime) }}</span>
        </template>
      </el-table-column>

    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />


  </div>
</template>

<script>
import { listPost, getPost, delPost } from "../../../api/questions/score"
// import { listPost, getPost, delPost } from "@/api/psychological/result"

export default {
  name: "Result",
  dicts: ['sys_normal_disable'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 结果表格数据
      postList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userName: undefined,

      },
      // 表单参数
      form: {},

    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询列表 */
    getList() {
      // alert(this.queryParams)
      this.loading = true
      listPost(this.queryParams).then(response => {
        this.postList = response.rows
        this.total = response.total
        this.loading = false
      })
    },
    // 取消按钮
    cancel() {
      this.open = false
      this.reset()
    },
    // 表单重置
    reset() {
      this.form = {
        userName: undefined,

      }
      this.resetForm("form")
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm")
      this.handleQuery()
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.recordId)
      this.single = selection.length!=1
      this.multiple = !selection.length
    },

    /** 删除按钮操作 */
    handleDelete(row) {
      const postIds = row.recordId || this.ids
      this.$modal.confirm('是否确认删除编号为"' + postIds + '"的数据项？').then(function() {
        return delPost(postIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },

  }
}
</script>
