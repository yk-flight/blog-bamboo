<template>
  <div class="tags-container">
    <el-card shadow="never">
      <div class="tags-header">
        <el-form :inline="true">
          <el-form-item>
            <span class="title-label">标签名称</span>
            <el-input
              v-model="name"
              placeholder="请输入标签名称"
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
        </div>
      </div>

      <!--  标签表格  -->
      <div class="tags-body">
        <el-table
          :data="tableData"
          border
          :header-cell-style="{ background: '#f8f8f9', color: '#606266' }"
          @selection-change="handleSelectionChange"
          ref="table"
          row-key="id"
          style="width: 100%"
          size="medium"
        >
          <el-table-column type="selection" width="50" align="center">
          </el-table-column>
          <el-table-column label="分类名称" align="center">
            <template slot-scope="scope">
              <el-tag>
                <span>{{ scope.row.name }}</span>
              </el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="articleNum" label="文章数量" align="center">
          </el-table-column>
          <el-table-column label="创建时间" align="center">
            <template slot-scope="scope">
              <span>{{ scope.row.createTime | dateFilter }}</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center">
            <template slot-scope="scope">
              <el-button
                type="text"
                @click="handleClick(scope.row)"
                icon="el-icon-edit-outline"
              >
                编辑
              </el-button>
              <!--  -->
              <el-button
                type="text"
                @click="handleDelete(scope.row)"
                icon="el-icon-delete"
              >
                删除
              </el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>

      <div class="tags-footer">
        <el-pagination
          :page-sizes="[10, 20, 50, 100]"
          :page-size="10"
          layout="total, sizes, prev, pager, next, jumper"
          :total="total"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        >
        </el-pagination>
      </div>
    </el-card>

    <!--  操作标签对话框  -->
    <el-dialog
      :title="dialogTitle"
      width="500px"
      :visible="dialogShow"
      :before-close="handleClose"
    >
      <el-form label-position="left">
        <el-form-item label="标签名称：" label-width="120px">
          <el-input v-model="tags.name" placeholder="请输入标签名称"></el-input>
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
import {
  getTagsList,
  insertTags,
  updateTags,
  deleteTagsBatchIds,
  deleteTags,
} from "@/api/article.js";

export default {
  name: "Tags",

  data() {
    return {
      tableData: [],
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 标签名称
      name: "",
      // 数据总条数
      total: 0,
      // 对话框中的数据
      tags: {
        id: undefined,
        name: "",
        articleNum: undefined,
      },
      // 对话框是否显示
      dialogShow: false,
      // 对话框标题
      dialogTitle: "",
      // 表格多选框
      multipleSelection: [],
    };
  },

  mounted() {
    this.getTableData();
  },

  methods: {
    // 获取表格数据
    getTableData() {
      getTagsList({
        curPage: this.curPage,
        size: this.size,
        name: this.name,
      }).then((result) => {
        this.tableData = result.list;
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
      this.dialogTitle = "添加标签";
      // 显示对话框
      this.dialogShow = true;
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
    // 点击了删除事件
    handleDelete(row) {
      this.$confirm("确定删除 " + row.name + " 吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteTags(row.id).then(() => {
            // 重新获取表格数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },
    // 点击批量删除数据
    handleDeleteBatch() {
      // 将选中的id进行存储
      const ids = [];
      this.multipleSelection.forEach((item) => {
        ids.push(item.id);
      });
      this.$confirm("确定删除这些标签吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          // 执行删除操作
          deleteTagsBatchIds(ids).then(() => {
            // 刷新表格数据
            this.getTableData();
          });
        })
        .catch(() => {});
    },
    // 关闭对话框
    handleClose() {
      this.dialogShow = false;
      // 重置对话框相关数据
      this.reset();
    },
    // 重置当前表单
    reset() {
      // 修改对话框标题
      this.dialogTitle = "";
      // 修改对话框对象
      this.tags = {};
    },
    // 点击提交按钮
    submitForm() {
      // 如果存在id则说明时更新
      if (this.tags.id) {
        updateTags(this.tags).then(() => {
          // 更新表格数据
          this.getTableData();
        });
      } else {
        // 添加操作
        insertTags(this.tags).then(() => {
          // 更新表格数据
          this.getTableData();
        });
      }
      // 重置对话框相关数据
      this.reset();
      // 关闭对话框
      this.dialogShow = false;
    },
    // 点击了操作栏里的编辑按钮
    handleClick(row) {
      this.dialogTitle = "修改标签";
      this.tags = row;
      this.dialogShow = true;
    },
  },
};
</script>

<style lang="scss" scoped>
.tags-container {
  margin-top: 10px;

  .tags-header {
    margin-top: 10px;
    padding-left: 15px;

    .title-label {
      font-size: 14px;
      font-weight: 700;
      color: #606266;
      margin-right: 12px;
    }
  }

  .tags-body {
    margin-top: 20px;
    padding-left: 15px;
    padding-right: 15px;
  }

  .tags-footer {
    padding-left: 15px;
    margin-top: 40px;
  }
}
</style>
