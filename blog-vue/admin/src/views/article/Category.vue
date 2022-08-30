<template>
  <div class="category-container">
    <el-card shadow="never">
      <div class="category-header">
        <el-form :inline="true">
          <el-form-item>
            <span class="title-label">分类名称</span>
            <el-input
              v-model="name"
              placeholder="请输入分类名称"
              style="width: 300px"
            ></el-input>
          </el-form-item>

          <el-form-item style="margin-left: 25px">
            <el-button
              type="primary"
              icon="el-icon-search"
              size="mini"
              @click="handleQuery"
              >搜索
            </el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">
              重置
            </el-button>
          </el-form-item>
        </el-form>

        <div class="button-container">
          <el-button
            type="primary"
            plain
            icon="el-icon-plus"
            size="mini"
            @click="handleAdd"
          >
            新增
          </el-button>
          <el-button
            type="danger"
            plain
            icon="el-icon-delete"
            size="mini"
            @click="handleDeleteBatch"
          >
            批量删除
          </el-button>
          <el-button
            type="info"
            plain
            icon="el-icon-upload2"
            size="mini"
            disabled
          >
            导入
          </el-button>
          <el-button type="warning" plain icon="el-icon-download" size="mini">
            导出
          </el-button>
        </div>
      </div>

      <div class="category-body">
        <el-table
          :data="tableData"
          border
          :header-cell-style="{ background: '#f8f8f9', color: '#606266' }"
          @selection-change="handleSelectionChange"
          ref="table"
          row-key="id"
          style="width: 100%"
          stripe
          size="medium"
        >
          <el-table-column
            type="selection"
            width="55"
            :reserve-selection="true"
          >
          </el-table-column>
          <el-table-column label="序号" width="60" align="center">
            <template slot-scope="scope">
              {{ scope.$index + 1 }}
            </template>
          </el-table-column>
          <el-table-column
            prop="name"
            label="分类名称"
            width="150"
            align="center"
          >
          </el-table-column>
          <el-table-column label="分类图片" width="170" align="center">
            <template slot-scope="scope">
              <el-image
                :src="scope.row.image"
                width="140px"
                @click="preViewImage(scope.row.image)"
                :preview-src-list="srcList"
              ></el-image>
            </template>
          </el-table-column>
          <el-table-column
            prop="description"
            label="分类描述"
            width="300"
            align="center"
          >
          </el-table-column>
          <el-table-column
            prop="articleAmount"
            label="文章数量"
            width="80"
            align="center"
          >
          </el-table-column>
          <el-table-column label="创建时间" width="200" align="center">
            <template slot-scope="scope">
              <span>{{ scope.row.createTime | dateFilter }}</span>
            </template>
          </el-table-column>
          <el-table-column label="更新时间" width="200" align="center">
            <template slot-scope="scope">
              <span>{{ scope.row.updateTime | dateFilter }}</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center">
            <template slot-scope="scope">
              <el-button
                @click="handleClick(scope.row)"
                type="text"
                size="small"
                >编辑</el-button
              >
              <el-button
                type="text"
                size="small"
                @click="handleDelete(scope.row)"
                >删除</el-button
              >
            </template>
          </el-table-column>
        </el-table>
      </div>

      <div class="category-footer">
        <el-pagination
          :page-sizes="[5, 10, 20, 50, 100]"
          :page-size="10"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </el-card>

    <el-dialog
      :title="dialogTitle"
      width="500px"
      :visible="dialogShow"
      :before-close="handleClose"
    >
      <el-form>
        <el-form-item label="分类名称" label-width="80px">
          <el-input
            placeholder="请输入分类名称"
            v-model="category.name"
          ></el-input>
        </el-form-item>
        <el-form-item label="分类图片" label-width="80px">
          <el-input
            placeholder="上传分类图片"
            v-model="category.image"
          ></el-input>
        </el-form-item>
        <el-form-item label="分类描述" label-width="80px">
          <el-input
            type="textarea"
            placeholder="请输入分类描述"
            v-model="category.description"
          ></el-input>
        </el-form-item>
        <el-form-item label="文章数量" label-width="80px">
          <el-input v-model="category.articleAmount" disabled></el-input>
        </el-form-item>
        <el-form-item label="创建时间" label-width="80px">
          <el-input
            placeholder="当前分类的创建时间"
            :value="dateFormat(category.createTime)"
            disabled
          ></el-input>
        </el-form-item>
        <el-form-item label="更新时间" label-width="80px">
          <el-input
            placeholder="当前分类的更新时间"
            :value="dateFormat(category.updateTime)"
            disabled
          ></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确定</el-button>
        <el-button @click="handleClose">取消</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import dayjs from "dayjs";
import {
  getCategoryByPage,
  insertCategory,
  updateCategory,
  deleteCategoryBatchIds,
  deleteCategory,
} from "@/api/article.js";

export default {
  name: "Category",

  data() {
    return {
      tableData: [],
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 分类名称
      name: "",
      // 数据总条数
      total: 0,
      // 对话框中的数据
      category: {
        id: undefined,
        name: "",
        image: "",
        description: "",
        articleAmount: 0,
        createTime: "",
        updateTime: "",
      },
      // 对话框是否显示
      dialogShow: false,
      // 对话框标题
      dialogTitle: "",
      // 表格多选框
      multipleSelection: [],
      // 图片预览
      srcList: [],
    };
  },

  mounted() {
    // 获取表格数据
    this.getTableData();
  },

  methods: {
    // 获取表格数据
    getTableData() {
      getCategoryByPage({
        curPage: this.curPage,
        size: this.size,
        name: this.name,
      }).then((result) => {
        // 定义当前返回的表格集合
        this.tableData = result.list;
        // 数据总条数
        this.total = result.total;
      });
    },
    // 点击搜索按钮后的操作
    handleQuery() {
      this.getTableData();
    },
    // 点击了重置按钮后的操作
    resetQuery() {
      this.name = "";
      // 清空搜索名称后再次刷新表格
      this.getTableData();
    },
    // 点击新增按钮后的操作
    handleAdd() {
      this.dialogTitle = "新增分类";
      // 定义新增操作时的字段值
      this.category.articleAmount = 0;
      this.category.createTime = this.dateFormat(new Date());
      this.category.updateTime = this.dateFormat(new Date());
      // 显示对话框
      this.dialogShow = true;
    },

    // 点击提交按钮
    submitForm() {
      this.dialogShow = false;

      // 如果存在id则说明时更新
      if (this.category.id) {
        updateCategory(this.category).then(() => {
          // 重新调用当前获取表格的方法
          this.getTableData();
        });
      } else {
        insertCategory(this.category).then(() => {
          // 重新调用当前获取表格的方法
          this.getTableData();
        });
      }
      // 重置对话框相关数据
      this.reset();
    },
    // 关闭对话框
    handleClose() {
      this.dialogShow = false;
      // 重置对话框相关数据
      this.reset();
    },

    // 点击了操作栏里的编辑按钮
    handleClick(row) {
      this.dialogTitle = "编辑分类";
      this.category = row;
      this.dialogShow = true;
    },

    // 重置当前表单
    reset() {
      // 修改对话框标题
      this.dialogTitle = "";
      // 修改对话框对象
      this.category = {};
    },

    // 当页面大小发生变化时
    handleSizeChange(val) {
      this.size = val;
      // 重新获取数据
      this.getTableData();
    },

    // 当前页发生变化时
    handleCurrentChange(val) {
      this.curPage = val;
      // 重新获取数据
      this.getTableData();
    },
    // 表格多选框点击事件
    handleSelectionChange(val) {
      this.multipleSelection = val; //存储选中的数据
    },

    // 点击批量删除数据
    handleDeleteBatch() {
      // 将选中的id进行存储
      const ids = [];
      this.multipleSelection.forEach((item) => {
        ids.push(item.id);
      });
      this.$confirm("确定删除这些分类吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteCategoryBatchIds(ids).then(() => {
            // 重新获取表格数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },

    // 点击删除按钮
    handleDelete(row) {
      this.$confirm("确定删除 " + row.name + " 吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteCategory(row.id).then(() => {
            // 重新获取表格数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },

    // 格式化时间
    dateFormat(date) {
      // 使用 dayjs 处理时间
      return dayjs(date).format("YYYY-MM-DD HH:mm:ss");
    },
    // 图片预览
    preViewImage(val) {
      this.srcList = [];
      this.srcList.push(val);
    },
  },
};
</script>

<style lang="scss" scoped>
.category-container {
  margin-top: 10px;

  .category-header {
    margin-top: 10px;
    padding-left: 15px;

    .title-label {
      font-size: 14px;
      font-weight: 700;
      color: #606266;
      margin-right: 12px;
    }
  }

  .category-body {
    margin-top: 20px;
    padding-left: 15px;
    padding-right: 15px;
  }

  .category-footer {
    padding-left: 15px;
    margin-top: 40px;
  }
}
</style>
