<template>
  <div>
    <el-form label-position="left" label-width="90px" :model="website">
      <el-form-item label="网站头像">
        <div class="upload-container">
          <el-upload action="#" class="avatar-uploader" :show-file-list="false">
            <img v-if="website.logo" :src="website.logo" class="avatar" />
            <i v-else class="el-icon-plus avatar-uploader-icon" />
          </el-upload>
          <div class="choose-button">
            <el-button
              icon="el-icon-picture"
              type="primary"
              @click="handleChoose"
              size="small"
              style="margin-top: 30px"
            >
              选择本地图片
            </el-button>
          </div>
        </div>
      </el-form-item>
      <!-- 网站名称 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="网站名称">
            <el-input size="small" v-model="website.name"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 网站作者 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="网站作者">
            <el-input size="small" v-model="website.author"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 网站简介 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="网站简介">
            <el-input size="small" v-model="website.introduction"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 创建日期 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="创建日期">
            <el-date-picker
              v-model="website.createDate"
              placeholder="选择日期"
              style="width: 100%"
            >
            </el-date-picker>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 网站公告 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="网站公告">
            <el-input
              type="textarea"
              rows="4"
              size="small"
              style="margin-top: 5px"
              v-model="website.publish"
            ></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 座右铭 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="座右铭">
            <el-input
              type="textarea"
              rows="4"
              size="small"
              style="margin-top: 10px"
              v-model="website.motto"
            ></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <!-- 备案号 -->
      <el-row :gutter="5">
        <el-col :span="8">
          <el-form-item label="备案号">
            <el-input size="small" v-model="website.record"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item>
        <div class="button-container">
          <el-button type="primary" @click="handleUpadte"> 修改 </el-button>
        </div>
      </el-form-item>
    </el-form>

    <!-- 选择图片对话框 -->
    <el-dialog
      title="本地图片"
      :visible="choose"
      :before-close="handleClose"
      width="1000"
    >
      <picture-view v-bind:url="fileUrl" @func="uploadFileUrl"></picture-view>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="sbumitChoose">确定</el-button>
        <el-button @click="handleClose">取消</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import dayjs from "dayjs";
import PictureView from "@/components/PictureView/index.vue";
import { getWebsiteInfo, updateWebsiteInfo } from "@/api/website.js";

export default {
  name: "Webset",
  components: { PictureView },
  data() {
    return {
      // 网站设置对象
      website: {
        id: undefined,
        name: "",
        author: "",
        introduction: "",
        logo: "",
        motto: "",
        publish: "",
        record: "",
      },
      // 图片选择对话框
      choose: false,
      // 图片路径
      fileUrl: "",
    };
  },

  mounted() {
    this.getData();
  },

  methods: {
    getData() {
      getWebsiteInfo().then((result) => {
        this.website = result;
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
        // 将选择的图片赋值给logo
        this.website.logo = this.fileUrl;
      } else {
        this.$message.info("取消选择图片");
      }
      // 关闭对话框
      this.handleClose();
    },
    // 更新图片的路径
    uploadFileUrl(val) {
      this.fileUrl = val;
    },
    // 更新网站信息
    handleUpadte() {
      console.log(this.website);
      this.website.createDate = this.dateFormat(this.website.createDate);
      updateWebsiteInfo(this.website).then((result) => {
        console.log(result);
        // 刷新当前表格数据
        this.getData();
      });
    },
    // 格式化时间
    dateFormat(date) {
      // 使用 dayjs 处理时间
      return dayjs(date).format("YYYY-MM-DD");
    },
  },
};
</script>

<style lang="scss" scoped>
.item-title {
  font-size: 15px;
  font-weight: 500;
}
.el-row {
  margin-bottom: 10px;
}
.el-form-item {
  margin-bottom: 10px;
}
.avatar-uploader {
  width: 100px;
  height: 100px;
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader:hover {
  border-color: #409eff;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #8c939d;
  width: 100px;
  height: 100px;
  line-height: 100px;
  text-align: center;
}
.avatar {
  width: 120px;
  height: 120px;
  display: block;
}
.upload-container {
  display: flex;
  margin-bottom: px;
}
.choose-button {
  margin-left: 30px;
}
</style>
