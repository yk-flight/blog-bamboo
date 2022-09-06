<template>
  <div>
    <el-dialog
      title="上传图片"
      :visible="visibled"
      width="520px"
      :before-close="handleDialogClose"
    >
      <el-row>
        <el-col :span="18" :offset="3">
          <el-upload
            ref="upload"
            class="upload-container"
            action="#"
            drag
            list-type="text"
            :http-request="requestUpload"
            :on-change="beforeUpload"
            :auto-upload="false"
          >
            <i class="el-icon-upload"></i>
            <div class="el-upload__text">
              将文件拖到此处，或<em>点击上传</em>
            </div>
            <div class="el-upload__tip" slot="tip">
              只能上传jpg/png文件，且不超过 10 MB
            </div>
          </el-upload>
        </el-col>
      </el-row>
      <span slot="footer" class="dialog-footer">
        <!-- @click="submitUpload" -->
        <el-button type="primary" @click="uploadFile">确定</el-button>
        <el-button @click="handleDialogClose">取消</el-button>
      </span>
    </el-dialog>
  </div>
</template>

<script>
import { upload } from "@/api/picture.js";

export default {
  name: "Upload",
  props: {
    // 定义是否展示
    visible: {
      type: Boolean,
      default: false,
    },
  },
  data() {
    return {
      // 是否显示对话框
      visibled: this.visible,
      file: {},
    };
  },
  watch: {
    visible(val) {
      //新增visble的监听变更并同步
      this.visibled = val;
    },
  },

  methods: {
    // 上传前的预处理
    beforeUpload(file) {
      const fileType = file.name
        .substring(file.name.lastIndexOf(".") + 1)
        .toLowerCase();
      const isLtSize = file.size / 1024 / 1024 < 10;
      if (["png", "jpeg", "jpg", "gif"].indexOf(fileType) === -1) {
        this.$message.error("上传图片只能是 JPG、PNG、GIF格式!");
        return false;
      }
      if (!isLtSize) {
        this.$message.error(`上传图片大小不能超过 10 MB!`);
        return false;
      }
      // 将当前上传的图片数据赋值给自定义file变量
      this.file = file;
      return true;
    },
    // 关闭对话框
    handleDialogClose() {
      this.visibled = !this.visibled;
      //组件内变更后向外部发送事件通知
      this.$emit("func", this.visibled);
    },
    // 覆盖默认的上传行为
    requestUpload() {
      let formData = new FormData();
      formData.append("file", this.file.raw);
      upload(formData).then((result) => {
        // 清除当前文件对象
        this.file = {};
      });
      // 关闭上传文件对话框
      this.handleDialogClose();
    },
    // 上传文件
    uploadFile() {
      this.$refs.upload.submit();
    },
  },
};
</script>

<style lang="scss" scoped></style>
