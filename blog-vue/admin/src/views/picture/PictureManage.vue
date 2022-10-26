<template>
  <div class="picture-container">
    <el-card shadow="never">
      <!-- 相册管理头部 -->
      <div class="picture-header">
        <el-form :inline="true">
          <el-form-item>
            <span class="title-label">相册名称</span>
            <el-input
              size="small"
              v-model="name"
              placeholder="请输入相册名称"
              style="width: 230px"
            ></el-input>
          </el-form-item>

          <el-form-item style="margin-left: 25px">
            <el-button
              type="primary"
              icon="el-icon-search"
              size="mini"
              @click="handleQuery"
            >
              搜索
            </el-button>
            <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">
              重置
            </el-button>
          </el-form-item>
        </el-form>
        <div style="margin-top: 10px">
          <el-row>
            <el-button
              type="primary"
              plain
              icon="el-icon-plus"
              size="mini"
              @click="addPhotoInfo"
            >
              新建相册
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
            <el-button
              type="text"
              icon="el-icon-delete"
              size="mini"
              @click="goRecycle"
              style="margin-left: 20px"
            >
              回收站
            </el-button>
          </el-row>
        </div>
      </div>

      <div class="picture-body">
        <!-- 相册列表 -->
        <el-row :gutter="25" class="file-container">
          <!-- 空状态 -->
          <el-empty v-if="photos.length == 0" description="暂无相册" />
          <el-col :md="6" v-for="item of photos" :key="item.id">
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
              <!-- 照片数量 -->
              <span class="file-num"> {{ item.count }} </span>
              <!-- 相册封面 -->
              <router-link :to="'/picture/photoManage/' + item.id">
                <el-image :src="item.image" fit="cover" class="file-img" />
              </router-link>
            </div>
            <!--  相册名称  -->
            <div class="file-name">
              <router-link
                :to="'/picture/photoManage/' + item.id"
                style="color: #303133"
              >
                {{ item.name }}
              </router-link>
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
        <el-form-item label="相册名称" label-width="80px">
          <el-input
            v-model="photo.name"
            size="small"
            placeholder="请输入相册名称"
          ></el-input>
        </el-form-item>
        <el-form-item label="相册描述" label-width="80px">
          <el-input
            v-model="photo.description"
            size="small"
            placeholder="请输入相册描述"
          ></el-input>
        </el-form-item>
        <el-form-item label="相册图片" label-width="80px">
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
            <el-empty v-if="!photo.image" description="暂无图片" />
            <el-image
              v-else
              style="margin-top: 10px; height: 200px; width: 100%"
              :src="photo.image"
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
import { listPhotoCover, save, removePhotos } from "@/api/photo";

export default {
  name: "PictureManage",
  components: { PictureView, Upload },
  data() {
    return {
      // 相册名称
      name: "",
      // 相册对象集合
      photos: [],
      // 是否删除
      deleted: 0,
      // 是否为相册
      parentId: 0,
      // 单个相册对象
      photo: {
        // 相册主键
        id: undefined,
        // 相册名称
        name: "",
        // 相册描述
        description: "",
        // 相册图片
        image: "",
        // 相册主键
        parentId: 0,
        // 照片数量
        count: 0,
      },
      // 相册信息对话框
      dialogShow: false,
      // 相册信息对话框标题
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
    this.getPhotoData();
  },

  methods: {
    // 获取所有相册数据
    getPhotoData() {
      listPhotoCover({
        name: this.name,
        deleted: this.deleted,
        parentId: this.parentId,
      }).then((result) => {
        this.photos = result;
      });
    },
    // 点击查询按钮操作
    handleQuery() {
      this.getPhotoData();
    },
    // 点击重置按钮
    resetQuery() {
      this.name = "";
    },
    // 点击刷新按钮执行的操作
    refreshFile() {
      this.getPhotoData();
    },
    // 点击了相册的操作按钮
    handleCommand(item) {
      this.photo = item;
      // 判断请求的类型
      if (typeof item === "number") {
        this.$confirm("确定要删除该相册吗？", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        })
          .then(() => {
            // 执行删除操作
            removePhotos(item).then((result) => {
              // 重新获取相册数据
              this.getPhotoData();
            });
          })
          .catch(() => {});
      } else {
        // 执行相册更新操作
        this.handleUpdate();
      }
    },
    // 重置相册对象方法
    reset() {
      this.photo.id = undefined;
      this.photo.name = "";
      this.photo.description = "";
      this.photo.parentId = 0;
      this.photo.count = 0;
      this.photo.image = "";
    },
    // 更新相册信息方法
    handleUpdate() {
      // 修改当前对话框标题
      this.dialogTitle = "编辑相册";
      // 显示更新相册对话框
      this.dialogShow = true;
    },
    // 相册对话框确定按钮
    handleSubmit() {
      // 如果当前相册对象存在ID则说明为更新操作
      // 更新相册
      save(this.photo).then(() => {
        // 关闭更新相册对话框
        this.handleDialogClose();
        // 重新获取相册数据
        this.getPhotoData();
      });
    },
    // 关闭对话框
    handleDialogClose() {
      this.dialogShow = false;
    },
    // 点击新建相册按钮
    addPhotoInfo() {
      // 重置当前相册对象
      this.reset();
      // 相册对话框标题
      this.dialogTitle = "新增相册";
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
        this.photo.image = this.fileUrl;
      } else {
        this.fileUrl = "";
        this.photo.image = "";
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
    // 前往回收站
    goRecycle() {
      this.$router.push("/picture/recyle");
    },
  },
};
</script>

<style lang="scss" scoped>
.picture-container {
  margin-top: 10px;

  .picture-header {
    margin-top: 10px;
    padding-left: 15px;
  }
  .title-label {
    font-size: 14px;
    font-weight: 700;
    color: #606266;
    margin-right: 12px;
  }
  .picture-body {
    margin: 30px 15px 10px 15px;
  }
  .file-img {
    // position: relative;
    border-radius: 5px;
    width: 100%;
    height: 180px;
    opacity: 0.6;
  }
  .file-item {
    border-radius: 5px;
    width: 100%;
    height: 180px;
    position: relative;
    cursor: pointer;
    background: #000;
  }
  .file-name {
    font-size: 16px;
    margin-top: 0.5rem;
    margin-bottom: 1rem;
    text-align: center;
    background: #fff;
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
  .file-num {
    position: absolute;
    z-index: 1000;
    bottom: 0.3rem;
    left: 0.5rem;
    font-size: 25px;
    font-weight: 500;
    color: #fff;
  }
}
</style>
