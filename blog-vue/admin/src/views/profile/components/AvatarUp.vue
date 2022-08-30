<template>
  <div>
    <el-row>
      <el-col :xs="24" :md="12" :style="{ height: '350px' }">
        <vue-cropper
          ref="cropper"
          :img="options.img"
          :info="true"
          :autoCrop="options.autoCrop"
          :autoCropWidth="options.autoCropWidth"
          :autoCropHeight="options.autoCropHeight"
          :canMove="options.canMove"
          @realTime="realTime"
        />
      </el-col>
      <el-col :xs="24" :md="12" :style="{ height: '350px' }">
        <div class="avatar-upload-preview">
          <img :src="previews.url" :style="previews.img" />
        </div>
      </el-col>
    </el-row>
    <br />
    <el-row>
      <el-col :lg="2" :md="2">
        <el-upload
          action="#"
          :http-request="requestUpload"
          :show-file-list="false"
        >
          <el-button size="small">
            选择
            <i class="el-icon-upload el-icon--right"></i>
          </el-button>
        </el-upload>
      </el-col>
      <el-col :lg="{ span: 1, offset: 2 }" :md="2">
        <el-button
          icon="el-icon-plus"
          size="small"
          @click="changeScale(1)"
        ></el-button>
      </el-col>
      <el-col :lg="{ span: 1, offset: 1 }" :md="2">
        <el-button
          icon="el-icon-minus"
          size="small"
          @click="changeScale(-1)"
        ></el-button>
      </el-col>
      <el-col :lg="{ span: 1, offset: 1 }" :md="2">
        <el-button
          icon="el-icon-refresh-left"
          size="small"
          @click="rotateLeft()"
        ></el-button>
      </el-col>
      <el-col :lg="{ span: 1, offset: 1 }" :md="2">
        <el-button
          icon="el-icon-refresh-right"
          size="small"
          @click="rotateRight()"
        ></el-button>
      </el-col>
      <el-col :lg="{ span: 2, offset: 6 }" :md="2">
        <el-button type="primary" size="small">提 交</el-button>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import { VueCropper } from "vue-cropper";

export default {
  name: "AvatarUp",
  components: { VueCropper },
  data() {
    return {
      options: {
        img: this.$store.getters.userInfo.avatar, //裁剪图片的地址
        autoCrop: true, // 是否默认生成截图框
        autoCropWidth: 200, // 默认生成截图框宽度
        autoCropHeight: 200, // 默认生成截图框高度
        canMoveBox: true, // 截图框能否拖动
        // fixedBox: true, // 固定截图框大小 不允许改变
      },
      previews: {},
    };
  },

  mounted() {},

  methods: {
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === "image/jpeg";
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error("上传头像图片只能是 JPG 格式!");
      }
      if (!isLt2M) {
        this.$message.error("上传头像图片大小不能超过 2MB!");
      }
      return isJPG && isLt2M;
    },
    // 实时预览
    realTime(data) {
      this.previews = data;
    },
    // 覆盖默认的上传行为
    requestUpload() {},
    // 向左旋转
    rotateLeft() {
      this.$refs.cropper.rotateLeft();
    },
    // 向右旋转
    rotateRight() {
      this.$refs.cropper.rotateRight();
    },
    // 图片缩放
    changeScale(num) {
      num = num || 1;
      this.$refs.cropper.changeScale(num);
    },
  },
};
</script>

<style lang="scss" scoped>
.user-info-head:hover:after {
  content: "+";
  position: absolute;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  color: #eee;
  background: rgba(0, 0, 0, 0.5);
  font-size: 24px;
  font-style: normal;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  cursor: pointer;
  line-height: 110px;
  border-radius: 50%;
}

.avatar-upload-preview {
  position: absolute;
  top: 50%;
  -webkit-transform: translate(50%, -50%);
  transform: translate(50%, -50%);
  width: 200px;
  height: 200px;
  border-radius: 50%;
  -webkit-box-shadow: 0 0 4px #ccc;
  box-shadow: 0 0 4px #ccc;
  overflow: hidden;
}
</style>
