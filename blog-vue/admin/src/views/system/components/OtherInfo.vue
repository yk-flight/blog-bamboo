<template>
  <div>
    <el-form label-position="left" label-width="90px" :model="websiteInfo">
      <!-- 游客头像 -->
      <el-form-item label="游客头像">
        <el-row>
          <el-upload
            class="upload-container"
            action="/upload/uploadImage"
            :show-file-list="false"
            ref="upload"
            accept="image/jpeg,image/gif,image/png,image/jpg"
            :data="uploadData"
            :on-success="handleWebsiteAvatarSuccess"
          >
            <div class="avatar-uploader">
              <el-image
                v-if="websiteInfo.avatar"
                :src="websiteInfo.avatar"
                fill="contain"
              ></el-image>
              <i v-else class="el-icon-plus avatar-uploader-icon" />
            </div>
          </el-upload>
        </el-row>
      </el-form-item>
      <!-- 评论审核 -->
      <el-form-item label="评论审核">
        <el-row>
          <el-col :span="5">
            <el-radio-group v-model="websiteInfo.commentAllow">
              <el-radio :label="true">开启</el-radio>
              <el-radio :label="false">关闭</el-radio>
            </el-radio-group>
          </el-col>
        </el-row>
      </el-form-item>
      <!-- 留言审核 -->
      <el-form-item label="留言审核">
        <el-row>
          <el-col :span="5">
            <el-radio-group v-model="websiteInfo.messageAllow">
              <el-radio :label="true">开启</el-radio>
              <el-radio :label="false">关闭</el-radio>
            </el-radio-group>
          </el-col>
        </el-row>
      </el-form-item>
      <!-- 打赏状态 -->
      <el-form-item label="打赏状态">
        <el-row>
          <el-col :span="5">
            <el-radio-group v-model="websiteInfo.reward">
              <el-radio :label="true">开启</el-radio>
              <el-radio :label="false">关闭</el-radio>
            </el-radio-group>
          </el-col>
        </el-row>
      </el-form-item>
      <!-- 收款码 -->
      <el-row>
        <el-col :span="4">
          <el-form-item label="微信收款码" label-width="60">
            <el-upload
              class="upload-container"
              action="/upload/uploadImage"
              :show-file-list="false"
              ref="upload"
              accept="image/jpeg,image/gif,image/png,image/jpg"
              :data="uploadReceiptData"
              :on-success="handleWechatReceiptSuccess"
            >
              <div class="avatar-uploader">
                <el-image
                  v-if="websiteInfo.wechatReceipt"
                  :src="websiteInfo.wechatReceipt"
                  fit="contain"
                ></el-image>
                <i v-else class="el-icon-plus avatar-uploader-icon" />
              </div>
            </el-upload>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="支付宝收款码" label-width="60">
            <el-upload
              class="upload-container"
              action="/upload/uploadImage"
              :show-file-list="false"
              ref="upload"
              accept="image/jpeg,image/gif,image/png,image/jpg"
              :data="uploadReceiptData"
              :on-success="handleAlipayReceiptSuccess"
            >
              <div class="avatar-uploader">
                <el-image
                  v-if="websiteInfo.alipayReceipt"
                  :src="websiteInfo.alipayReceipt"
                  fit="contain"
                ></el-image>
                <i v-else class="el-icon-plus avatar-uploader-icon" />
              </div>
            </el-upload>
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item>
        <el-button
          style="margin-top: 10px"
          type="primary"
          @click="handleUpadte"
        >
          修改
        </el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { getWebsiteOtherInfo, updateWebsiteOtherInfo } from "@/api/website.js";

export default {
  name: "OtherInfo",
  data() {
    return {
      // 网站其他信息对象
      websiteInfo: {
        // 主键
        id: undefined,
        // 游客默认头像
        avatar: "",
        // 评论审核
        commentAllow: true,
        // 留言审核
        messageAllow: true,
        // 打赏状态
        reward: true,
        // 微信收款码
        wechatReceipt: "",
        // 支付宝收款码
        alipayReceipt: "",
      },
      // 文件上传附带参数
      uploadData: {
        // 文件存储路径
        path: "avatar/",
        // 上传用户
        user: this.$store.getters.userInfo.nickName,
      },
      uploadReceiptData: {
        // 文件存储路径
        path: "receipt/",
        // 上传用户
        user: this.$store.getters.userInfo.nickName,
      },
    };
  },
  mounted() {
    this.getData();
  },
  methods: {
    // 获取网页数据
    getData() {
      getWebsiteOtherInfo().then((result) => {
        this.websiteInfo = result;
      });
    },
    // 游客头像上传成功回调
    handleWebsiteAvatarSuccess(result) {
      this.websiteInfo.avatar = result;
    },
    // 微信收款码上传成功回调
    handleWechatReceiptSuccess(result) {
      this.websiteInfo.wechatReceipt = result;
    },
    // 支付宝收款码上传成功回调
    handleAlipayReceiptSuccess(result) {
      this.websiteInfo.alipayReceipt = result;
    },
    // 点击修改按钮
    handleUpadte() {
      updateWebsiteOtherInfo(this.websiteInfo).then(() => {
        // 更新当前数据
        this.getData();
      });
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
  margin-bottom: 5px;
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
// .avatar {
//   width: 120px;
//   height: 120px;
//   display: block;
// }
.upload-container {
  display: flex;
  margin-top: 10px;
}
.website-title {
  text-decoration: none;
  font-size: 12px;
  color: #303133;
}
.website-title a {
  color: #409eff;
}
.title {
  margin-bottom: 20px;
}
</style>
