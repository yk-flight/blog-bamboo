<template>
  <div class="category-container">
    <el-card shadow="never">
      <div class="category-header">
        <el-form :inline="true">
          <el-form-item>
            <span class="title-label">分类名称</span>
            <el-input
              size="small"
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
          size="medium"
        >
          <el-table-column type="selection" width="50" align="center">
          </el-table-column>
          <el-table-column prop="name" label="分类名称" align="center">
          </el-table-column>
          <el-table-column label="分类图片" align="center" width="200">
            <template slot-scope="scope">
              <el-empty
                v-if="!scope.row.image"
                description="暂无图片"
                :image-size="40"
                style="height: 60px"
              ></el-empty>
              <el-image
                v-else
                :src="scope.row.image"
                @click="preViewImage(scope.row.image)"
                :preview-src-list="srcList"
              ></el-image>
            </template>
          </el-table-column>
          <el-table-column prop="description" label="分类描述" align="center">
          </el-table-column>
          <el-table-column prop="articleAmount" label="文章数量" align="center">
          </el-table-column>
          <el-table-column label="创建时间" align="center">
            <template slot-scope="scope">
              <span>{{ scope.row.createTime | dateFilter }}</span>
            </template>
          </el-table-column>
          <el-table-column label="操作" align="center">
            <template slot-scope="scope">
              <el-button
                @click="handleClick(scope.row)"
                type="text"
                icon="el-icon-edit-outline"
              >
                编辑
              </el-button>
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

      <div class="category-footer">
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

    <!-- 编辑分类信息对话框 -->
    <el-dialog
      :title="dialogTitle"
      width="600px"
      :visible="dialogShow"
      :before-close="handleClose"
      :close-on-click-modal="false"
    >
      <el-form style="margin-right: 20px">
        <el-form-item label="分类名称" label-width="80px">
          <el-input
            size="small"
            placeholder="请输入分类名称"
            v-model="category.name"
          ></el-input>
        </el-form-item>
        <el-form-item label="分类图片" label-width="80px">
          <el-row style="margin-bottom: 10px">
            <el-button
              size="small"
              icon="el-icon-picture"
              @click="handleChoose"
            >
              选择本地
            </el-button>
            <el-button
              size="small"
              type="primary"
              icon="el-icon-picture"
              @click="handleUpload"
            >
              上传图片
            </el-button>
          </el-row>
          <el-row>
            <div class="image-uploader">
              <img v-if="category.image" :src="category.image" class="image" />
              <i v-else class="el-icon-upload image-uploader-icon" />
            </div>
          </el-row>
        </el-form-item>
        <el-form-item label="分类描述" label-width="80px">
          <el-input
            type="textarea"
            placeholder="请输入分类描述"
            rows="5"
            v-model="category.description"
          ></el-input>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确定</el-button>
        <el-button @click="handleClose">取消</el-button>
      </span>
    </el-dialog>

    <!-- 选择图片对话框 -->
    <el-dialog
      title="本地图片"
      :visible="choose"
      :before-close="handlePictureClose"
      width="1000"
    >
      <picture-view v-bind:url="fileUrl" @func="uploadFileUrl"></picture-view>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="sbumitChoose">确定</el-button>
        <el-button @click="handlePictureClose">取消</el-button>
      </span>
    </el-dialog>

    <!-- 上传文件对话框 -->
    <upload v-bind:visible="uploadDialog" @func="handleDialogClose"></upload>
  </div>
</template>

<script>
import dayjs from "dayjs";
import Upload from "@/components/Upload";
import PictureView from "@/components/PictureView/index.vue";
import {
  getCategoryByPage,
  insertCategory,
  updateCategory,
  deleteCategoryBatchIds,
  deleteCategory,
} from "@/api/article.js";

export default {
  name: "Category",
  components: { PictureView, Upload },
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
      // 图片选择对话框
      choose: false,
      // 图片路径
      fileUrl: "",
      // 文件上传对话框
      uploadDialog: false,
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
    // 选择本地图片
    handleChoose() {
      this.choose = true;
    },
    // 关闭选择图片对话框
    handlePictureClose() {
      this.choose = false;
    },
    // 确定选择
    sbumitChoose() {
      if (this.fileUrl) {
        this.$message.success("图片选择成功");
        // 将选择的图片赋值给logo
        this.category.image = this.fileUrl;
      } else {
        this.category.image = "";
        this.fileUrl = "";
        this.$message.info("取消选择图片");
      }
      // 关闭对话框
      this.handlePictureClose();
    },
    // 更新图片的路径
    uploadFileUrl(val) {
      this.fileUrl = val;
    },
    // 关闭对话框
    handleDialogClose() {
      this.uploadDialog = false;
    },
    // 处理上传文件方法
    handleUpload() {
      this.uploadDialog = true;
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
  .image-uploader {
    width: 460px;
    height: 260px;
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .image-uploader:hover {
    border-color: #409eff;
  }
  .image-uploader-icon {
    font-size: 80px;
    color: #8c939d;
    width: 460px;
    height: 100px;
    line-height: 220px;
    text-align: center;
  }
  .image {
    width: 460px;
    height: 260px;
    display: block;
  }
}
</style>
