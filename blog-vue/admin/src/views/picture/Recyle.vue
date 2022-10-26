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
        <el-row>
          <el-button
            type="success"
            icon="el-icon-refresh"
            size="mini"
            @click="recoverBatchIds"
          >
            批量恢复
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
      </div>

      <div class="picture-body">
        <!-- 相册列表 -->
        <el-row :gutter="25" class="file-container">
          <!-- 空状态 -->
          <el-empty v-if="photos.length == 0" description="暂无相册" />
          <el-checkbox-group
            v-model="selectFilesList"
            @change="handleCheckedFilesChange"
          >
            <el-col :md="6" v-for="item of photos" :key="item.id">
              <el-checkbox :label="item.id">
                <div class="file-item">
                  <!-- 照片数量 -->
                  <span class="file-num" v-if="item.parentId == 0">
                    {{ item.count }}
                  </span>
                  <!-- 相册封面 -->
                  <el-image :src="item.image" fit="cover" class="file-img" />
                </div>
              </el-checkbox>
              <!--  相册名称  -->
              <div class="file-name">{{ item.name }}</div>
            </el-col>
          </el-checkbox-group>
        </el-row>
      </div>
    </el-card>
  </div>
</template>

<script>
import PictureView from "@/components/PictureView/index.vue";
import {
  listPhotoCover,
  recoverPhotosBatchIds,
  deletePhotosBatchIds,
} from "@/api/photo";

export default {
  name: "PictureManage",
  components: { PictureView },
  data() {
    return {
      // 相册名称
      name: "",
      // 相册对象集合
      photos: [],
      // 是否删除
      deleted: 1,
      // 是否为相册
      parentId: -1,
      // 选中的片ID
      selectFilesList: [],
      // 当前所有图片的ID
      filesIds: [],
      // 是否选中所有图片
      checkAll: false,
    };
  },

  mounted() {
    this.getPhotoData();
  },

  methods: {
    // 获取所有相册数据
    getPhotoData() {
      // 清除所有选中的节点
      this.filesIds = [];
      listPhotoCover({
        name: this.name,
        deleted: this.deleted,
        parentId: this.parentId,
      }).then((result) => {
        this.photos = result;
        // 将所有的文件ID进行存储
        this.photos.forEach((item) => {
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
    // 批量恢复相册
    recoverBatchIds() {
      this.$confirm("确定要恢复选中的相册吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "success",
      })
        .then(() => {
          if (this.selectFilesList.length == 0) {
            this.$message.warning("请选择要恢复的相册");
            return;
          }
          recoverPhotosBatchIds(this.selectFilesList).then((result) => {
            // 重新获取数据
            this.getPhotoData();
            // 清空选择框中的数据
            this.selectFilesList = [];
          });
        })
        .catch(() => {});
    },
    // 批量删除相册
    deleteBatchIds() {
      this.$confirm("确定要删除选中的相册吗？", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          if (this.selectFilesList.length == 0) {
            this.$message.warning("请选择要删除的相册");
            return;
          }
          deletePhotosBatchIds(this.selectFilesList).then((result) => {
            // 重新获取数据
            this.getPhotoData();
            // 清空选择框中的数据
            this.selectFilesList = [];
          });
        })
        .catch(() => {});
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
  .file-num {
    position: absolute;
    z-index: 1000;
    bottom: 0.3rem;
    left: 0.5rem;
    font-size: 25px;
    font-weight: 500;
    color: #fff;
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
}
</style>
