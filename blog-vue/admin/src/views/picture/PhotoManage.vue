<template>
  <div class="picture-container">
    <el-card shadow="never">
      <!-- 照片管理头部 -->
      <div class="picture-header">
        <!-- 相册封面 -->
        <el-image
          :src="photos.image"
          fit="cover"
          class="photos-image"
        ></el-image>
        <div class="photos-info">
          <!-- 相册名称 -->
          <div style="margin: 10px 0px">
            <span class="photo-name">{{ photos.name }}</span>
            <span class="photo-num">{{ photos.count }}张</span>
          </div>
          <!-- 相册描述 -->
          <div class="photo-description">
            {{ photos.description }}
          </div>
        </div>
      </div>
      <el-row style="margin: 20px 15px">
        <el-button
          type="primary"
          icon="el-icon-picture"
          size="mini"
          @click="addPhotoInfo"
        >
          新增照片
        </el-button>
        <el-button
          type="danger"
          icon="el-icon-delete"
          size="mini"
          @click="deleteBatchIds"
        >
          批量删除
        </el-button>

        <span class="file-count">已选择{{ selectFilesList.length }}张</span>
        <el-checkbox
          class="all-check"
          v-model="checkAll"
          @change="handleCheckAllChange"
        >
          全选
        </el-checkbox>
      </el-row>

      <div class="picture-body">
        <!-- 照片列表 -->
        <el-row :gutter="25" class="file-container">
          <!-- 空状态 -->
          <el-empty
            v-if="photos.children && photos.children.length == 0"
            description="暂无照片"
          />
          <el-checkbox-group
            v-model="selectFilesList"
            @change="handleCheckedFilesChange"
          >
            <el-col :md="6" v-for="item of photos.children" :key="item.id">
              <el-checkbox :label="item.id">
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

                  <!-- 照片封面 -->
                  <el-image :src="item.image" fit="cover" class="file-img" />
                  <!--  照片名称  -->
                  <div class="file-name">{{ item.name }}</div>
                </div>
              </el-checkbox>
            </el-col>
          </el-checkbox-group>
        </el-row>
      </div>
      <!-- 文件详情对话框 -->
      <el-dialog
        :title="dialogTitle"
        :visible="dialogShow"
        width="550px"
        :before-close="handleDialogClose"
        :close-on-click-modal="false"
      >
        <el-form>
          <el-form-item label="照片名称" label-width="80px">
            <el-input
              v-model="photo.name"
              size="small"
              placeholder="请输入照片名称"
            ></el-input>
          </el-form-item>
          <el-form-item label="照片描述" label-width="80px">
            <el-input
              v-model="photo.description"
              size="small"
              placeholder="请输入照片描述"
            ></el-input>
          </el-form-item>
          <el-form-item label="照片图片" label-width="80px">
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

    <!-- 上传文件对话框 -->
    <upload v-bind:visible="uploadDialog" @func="handleUploadClose"></upload>
  </div>
</template>

<script>
import Upload from "@/components/Upload";
import PictureView from "@/components/PictureView/index.vue";
import {
  listPhotoById,
  save,
  removePhotos,
  deletePhotoBatchIds,
} from "@/api/photo";

export default {
  name: "PhotoManage",
  components: { PictureView, Upload },
  data() {
    return {
      // 照片对象集合
      photos: [],
      // 单个照片对象
      photo: {
        // 照片主键
        id: undefined,
        // 照片名称
        name: "",
        // 照片描述
        description: "",
        // 照片图片
        image: "",
        // 照片主键
        parentId: 1,
        // 照片数量
        count: 0,
      },
      // 选中的片ID
      selectFilesList: [],
      // 当前所有图片的ID
      filesIds: [],
      // 是否选中所有图片
      checkAll: false,
      // 照片信息对话框
      dialogShow: false,
      // 照片信息对话框标题
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
    // 获取所有照片数据
    getPhotoData() {
      // 清除所有选中的节点
      this.filesIds = [];
      // 获取到当前的ID
      let id = this.$route.params.id;
      listPhotoById(id).then((result) => {
        this.photos = result;
        // 将所有的文件ID进行存储
        this.photos.children.forEach((item) => {
          this.filesIds.push(item.id);
        });
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
    // 全选
    handleCheckAllChange(val) {
      this.selectFilesList = val ? this.filesIds : [];
    },
    // 多选图片时的选项
    handleCheckedFilesChange() {},
    // 批量删除照片
    deleteBatchIds() {
      this.$confirm("确定要删除选中的照片吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          if (this.selectFilesList.length == 0) {
            this.$message.warning("请选择要删除的照片");
            return;
          }
          deletePhotoBatchIds(this.selectFilesList).then((result) => {
            // 重新获取数据
            this.getPhotoData();
            // 清空选择框中的数据
            this.selectFilesList = [];
          });
        })
        .catch(() => {});
    },
    // 点击了照片的操作按钮
    handleCommand(item) {
      this.photo = item;
      // 判断请求的类型
      if (typeof item === "number") {
        this.$confirm("确定要删除该照片吗？", "提示", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        })
          .then(() => {
            // 执行删除操作
            removePhotos(item).then((result) => {
              // 重新获取照片数据
              this.getPhotoData();
            });
          })
          .catch(() => {});
      } else {
        // 执行照片更新操作
        this.handleUpdate();
      }
    },
    // 更新照片信息方法
    handleUpdate() {
      // 修改当前对话框标题
      this.dialogTitle = "编辑照片";
      // 显示更新照片对话框
      this.dialogShow = true;
    },
    // 关闭对话框
    handleDialogClose() {
      this.dialogShow = false;
    },
    // 照片对话框确定按钮
    handleSubmit() {
      // 如果当前照片对象存在ID则说明为更新操作
      this.photo.parentId = this.photos.id;
      // 更新照片
      save(this.photo).then(() => {
        // 关闭更新照片对话框
        this.handleDialogClose();
        // 重新获取照片数据
        this.getPhotoData();
      });
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
    // 点击新建照片按钮
    addPhotoInfo() {
      // 重置当前照片对象
      this.reset();
      // 照片对话框标题
      this.dialogTitle = "新增照片";
      // 显示对话框
      this.dialogShow = true;
    },
    // 重置照片对象方法
    reset() {
      this.photo.id = undefined;
      this.photo.name = "";
      this.photo.description = "";
      this.photo.parentId = 0;
      this.photo.count = 0;
      this.photo.image = "";
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
    display: flex;
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
    position: relative;
    border-radius: 5px;
    width: 100%;
    height: 180px;
  }
  .file-item {
    border-radius: 5px;
    width: 100%;
    height: 180px;
    position: relative;
    cursor: pointer;
  }
  .file-name {
    font-size: 16px;
    margin-top: 0.5rem;
    margin-bottom: 1rem;
    text-align: center;
    background: #fff;
  }
  .all-check {
    float: right;
    display: inline-flex;
    align-items: center;
    margin-right: 1rem;
  }
  .file-count {
    float: right;
    font-size: 14px;
    line-height: 20px;
    margin-right: 1rem;
  }
  .file-opreation {
    position: absolute;
    z-index: 1000;
    top: 0.3rem;
    right: 0.5rem;
  }
  .photos-image {
    border-radius: 5px;
    width: 5rem;
    height: 5rem;
  }
  .photos-info {
    margin-left: 20px;
  }
  .photo-name {
    font-size: 20px;
    font-weight: 600;
  }
  .photo-description {
    font-size: 14px;
    color: #303133;
  }
  .photo-num {
    margin-left: 10px;
    font-size: 13px;
  }
  .el-form-item {
    margin-bottom: 5px;
  }
}
</style>
