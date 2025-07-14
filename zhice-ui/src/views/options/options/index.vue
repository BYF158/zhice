<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="所属题号" prop="questionNumber">
        <el-input
          v-model="queryParams.questionNumber"
          placeholder="请输入所属题号"
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['options:options:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['options:options:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['options:options:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['options:options:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="optionsList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="选项id" align="center" prop="optionId" />
      <el-table-column label="选项文本" align="center" prop="optionText" />
      <el-table-column label="选项类型" align="center" prop="optionType" />
      <el-table-column label="选项定义" align="center" prop="optionDefinition" />
      <el-table-column label="所属题号" align="center" prop="questionNumber" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['options:options:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['options:options:remove']"
          >删除</el-button>
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

    <!-- 添加或修改选项管理对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="选项文本" prop="optionText">
          <el-input v-model="form.optionText" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="选项定义" prop="optionDefinition">
          <el-input v-model="form.optionDefinition" type="textarea" placeholder="请输入内容" />
        </el-form-item>
        <el-form-item label="所属题号" prop="questionNumber">
          <el-input v-model="form.questionNumber" placeholder="请输入所属题号" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listOptions, getOptions, delOptions, addOptions, updateOptions } from "@/api/options/options"

export default {
  name: "Options",
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
      // 选项管理表格数据
      optionsList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        optionText: null,
        optionType: null,
        optionDefinition: null,
        questionNumber: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        optionText: [
          { required: true, message: "选项文本不能为空", trigger: "blur" }
        ],
        optionType: [
          { required: true, message: "选项类型不能为空", trigger: "change" }
        ],
        questionNumber: [
          { required: true, message: "所属题号不能为空", trigger: "blur" }
        ]
      }
    }
  },
  created() {
    this.getList()
  },
  methods: {
    /** 查询选项管理列表 */
    getList() {
      this.loading = true
      listOptions(this.queryParams).then(response => {
        this.optionsList = response.rows
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
        optionId: null,
        optionText: null,
        optionType: null,
        optionDefinition: null,
        questionNumber: null
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
      this.ids = selection.map(item => item.optionId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset()
      this.open = true
      this.title = "添加选项管理"
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset()
      const optionId = row.optionId || this.ids
      getOptions(optionId).then(response => {
        this.form = response.data
        this.open = true
        this.title = "修改选项管理"
      })
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.optionId != null) {
            updateOptions(this.form).then(response => {
              this.$modal.msgSuccess("修改成功")
              this.open = false
              this.getList()
            })
          } else {
            addOptions(this.form).then(response => {
              this.$modal.msgSuccess("新增成功")
              this.open = false
              this.getList()
            })
          }
        }
      })
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const optionIds = row.optionId || this.ids
      this.$modal.confirm('是否确认删除选项管理编号为"' + optionIds + '"的数据项？').then(function() {
        return delOptions(optionIds)
      }).then(() => {
        this.getList()
        this.$modal.msgSuccess("删除成功")
      }).catch(() => {})
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('options/options/export', {
        ...this.queryParams
      }, `options_${new Date().getTime()}.xlsx`)
    }
  }
}
</script>
