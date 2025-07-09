<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small"
    :inline="true" v-show="showSearch" label-width="68px">

      <el-form-item label="用户名称" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户名称"


        />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>

      </el-form-item>
    </el-form>



    <el-table v-loading="loading" :data="postList" @selection-change="handleSelectionChange">
       <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="用户" prop="userName" width="120" />
      <el-table-column label="名称" prop="prototypeName" :show-overflow-tooltip="true" width="150" />
      <el-table-column label="得分" prop="score" :show-overflow-tooltip="true" width="150" />


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
import { listPost, listScore, delPost } from "../../../api/questions/score"
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
        userName: "",

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
      // this.queryParams.userName='zz';
      // alert("queryParams.userName:"+this.queryParams.userName)
      this.loading = true
      listScore(this.queryParams).then(response => {
        this.postList = response.rows
        this.total = response.total
        this.loading = false
      })
    },

    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1
      this.getList()
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



  }
}
</script>
