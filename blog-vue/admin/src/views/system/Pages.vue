<template>
  <div class="page-container">
    <el-card shadow="never">
      <!-- 页面管理头部 -->
      <div class="page-header">
        <div class="button-container">
          <el-row>
            <el-button
              type="primary"
              plain
              icon="el-icon-plus"
              size="mini"
              @click="addPageInfo"
            >
              新建页面
            </el-button>
            <el-button
              type="info"
              plain
              icon="el-icon-refresh"
              size="mini"
              @click="refreshFile"
            >
              刷新
            </el-button>
          </el-row>
        </div>
      </div>

      <div class="page-body">
        <!-- 照片列表 -->
        <el-row :gutter="25" class="file-container">
          <!-- 空状态 -->
          <el-empty v-if="pages.length == 0" description="暂无页面" />
          <el-col :md="6" v-for="item of pages" :key="item.id">
            <div class="file-item">
              <!--  图片操作  -->
              <div class="file-opreation">
                <el-dropdown @command="handleCommand">
                  <i class="el-icon-more" style="color: #fff" />
                  <el-dropdown-menu slot="dropdown">
                    <el-dropdown-item :command="item">
                      <i class="el-icon-edit" />编辑
                    </el-dropdown-item>
                    <el-dropdown-item :command="item.id">
                      <i class="el-icon-delete" />删除
                    </el-dropdown-item>
                  </el-dropdown-menu>
                </el-dropdown>
              </div>
              <!-- 空状态 -->
              <el-image :src="item.image" fit="cover" class="file-img" />
              <!--  照片名称  -->
              <div class="file-name">{{ item.title }}</div>
            </div>
          </el-col>
        </el-row>
      </div>
    </el-card>

    <!-- 选择图片对话框 -->
    <el-dialog
      title="本地图片"
      :visible="choose"
      :before-close="handleClose"
      width="1000"
    >
      <picture-view v-bind:url="fileUrl" @func="uploadFileUrl"></picture-view>
      <span slot="footer">
        <el-button type="primary" @click="sbumitChoose">确定</el-button>
        <el-button @click="handleClose">取消</el-button>
      </span>
    </el-dialog>

    <!-- 文件详情对话框 -->
    <el-dialog
      :title="dialogTitle"
      :visible="dialogShow"
      width="550px"
      :before-close="handleDialogClose"
      :close-on-click-modal="false"
    >
      <el-form>
        <el-form-item label="页面名称" label-width="80px">
          <el-input
            v-model="page.title"
            size="small"
            placeholder="请输入页面名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="页面标识" label-width="80px">
          <el-input
            v-model="page.label"
            size="small"
            placeholder="请输入页面标识"
          ></el-input>
        </el-form-item>
        <el-form-item label="页面路径" label-width="80px">
          <el-input
            v-model="page.path"
            size="small"
            placeholder="请输入页面路径"
          ></el-input>
        </el-form-item>
        <el-form-item label="页面图片" label-width="80px">
          <el-row>
            <el-button
              size="small"
              icon="el-icon-picture"
              @click="handleChoose"
            >
              选择本地
            </el-button>
            <el-button
              type="primary"
              size="small"
              icon="el-icon-upload"
              @click="handleUpload"
            >
              上传图片
            </el-button>
          </el-row>
          <el-row>
            <!-- 空状态 -->
            <el-empty v-if="!page.image" description="暂无图片" />
            <el-image
              v-else
              style="margin-top: 10px; height: 200px; width: 100%"
              :src="page.image"
              fit="contain"
            >
            </el-image>
          </el-row>
        </el-form-item>
      </el-form>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="handleSubmit">确定</el-button>
        <el-button @click="handleDialogClose">取消</el-button>
      </span>
    </el-dialog>

    <!-- 上传文件对话框 -->
    <upload v-bind:visible="uploadDialog" @func="handleUploadClose"></upload>
  </div>
</template>

<script>
import PictureView from "@/components/PictureView/index.vue";
import Upload from "@/components/Upload";
import { getPagesList, updatePageInfo, addPages, deletePage } from "@/api/page";

export default {
  name: "Pages",
  components: { PictureView, Upload },
  data() {
    return {
      // 页面对象集合
      pages: [],
      // 单个页面对象
      page: {
        // 页面主键
        id: undefined,
        // 页面名称
        title: "",
        // 页面标签
        label: "",
        // 页面图片
        image: "",
        // 页面路径
        path: "",
      },
      // 页面信息对话框
      dialogShow: false,
      // 页面信息对话框标题
      dialogTitle: "",
      // 选择本地图片对话框
      choose: false,
      // 图片路径
      fileUrl: "",
      // 文件上传对话框
      uploadDialog: false,
    };
  },

  mounted() {
    this.getPageData();
  },

  methods: {
    // 获取所有页面数据
    getPageData() {
      getPagesList().then((result) => {
        this.pages = result;
      });
    },
    // 点击刷新按钮执行的操作
    refreshFile() {
      this.getPageData();
    },
    // 点击了页面的编辑按钮
    handleCommand(item) {
      this.page = item;
      // 判断请求的类型
      if (typeof item === "number") {
        this.$confirm("确定要删除该页面吗？", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        })
          .then(() => {
            // 执行删除操作
            deletePage(item).then(() => {
              // 重新获取页面数据
              this.getPageData();
            });
          })
          .catch(() => {});
      } else {
        // 执行页面更新操作
        this.handleUpdate();
      }
    },
    // 重置页面对象方法
    reset() {
      this.page.id = undefined;
      this.page.title = "";
      this.page.label = "";
      this.page.path = "";
      this.page.image = "";
    },
    // 更新页面信息方法
    handleUpdate() {
      // 修改当前对话框标题
      this.dialogTitle = "编辑页面";
      // 显示更新页面对话框
      this.dialogShow = true;
    },
    // 页面对话框确定按钮
    handleSubmit() {
      // 如果当前页面对象存在ID则说明为更新操作
      if (this.page.id) {
        // 更新页面
        updatePageInfo(this.page).then(() => {
          // 关闭更新页面对话框
          this.handleDialogClose();
          // 重新获取页面数据
          this.getPageData();
        });
      } else {
        // 否则为添加操作
        addPages(this.page).then(() => {
          // 重新获取页面信息
          this.getPageData();
        });
      }
    },
    // 关闭对话框
    handleDialogClose() {
      this.dialogShow = false;
    },
    // 点击新建页面按钮
    addPageInfo() {
      // 重置当前页面对象
      this.reset();
      // 页面对话框标题
      this.dialogTitle = "新增页面";
      // 显示对话框
      this.dialogShow = true;
    },
    // 选择本地图片
    handleChoose() {
      this.choose = true;
    },
    // 关闭选择图片对话框
    handleClose() {
      this.choose = false;
    },
    // 确定选择
    sbumitChoose() {
      if (this.fileUrl) {
        this.$message.success("图片选择成功");
        // 将选择的图片赋值给当前文章的图片
        this.page.image = this.fileUrl;
      } else {
        this.fileUrl = "";
        this.page.image = "";
        this.$message.info("取消选择图片");
      }
      // 关闭对话框
      this.handleClose();
    },
    // 更新图片的路径
    uploadFileUrl(val) {
      this.fileUrl = val;
    },
    // 关闭对话框
    handleUploadClose() {
      this.uploadDialog = false;
    },
    // 处理上传文件方法
    handleUpload() {
      this.uploadDialog = true;
    },
  },
};
</script>

<style lang="scss" scoped>
.page-container {
  margin-top: 10px;
  .page-header {
    margin-top: 10px;
    padding-left: 15px;
  }
  .page-body {
    margin: 30px 15px 0px 15px;
  }
  .file-img {
    position: relative;
    border-radius: 5px;
    width: 100%;
    height: 180px;
  }
  .file-item {
    width: 100%;
    position: relative;
    cursor: pointer;
    margin-bottom: 1rem;
  }
  .file-name {
    font-size: 16px;
    margin-top: 0.3rem;
    margin-bottom: 1rem;
    text-align: center;
  }
  .file-opreation {
    position: absolute;
    z-index: 1000;
    top: 0.3rem;
    right: 0.5rem;
  }
  .el-form-item {
    margin-bottom: 5px;
  }
}
</style>
