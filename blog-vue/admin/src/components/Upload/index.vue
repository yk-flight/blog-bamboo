<template>
  <div>
    <el-dialog
      title="上传图片"
      :visible="visibled"
      width="520px"
      :before-close="handleDialogClose"
    >
      <el-row style="margin-bottom: 25px">
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
            :file-list="fileList"
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
      <!-- 文件用途 -->
      <el-row class="use-container">
        <el-col :span="4" :offset="3">
          <span class="use-title">图片用途：</span>
        </el-col>
        <el-col :span="17">
          <el-select
            v-model="value"
            clearable
            placeholder="请选择图片用途"
            size="small"
          >
            <el-option
              v-for="item in options"
              :key="item.path"
              :label="item.description"
              :value="item.path"
            >
            </el-option>
          </el-select>
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
import { getFileUse } from "@/api/file.js";
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
  created() {
    this.getFilesUse();
  },
  data() {
    return {
      // 是否显示对话框
      visibled: this.visible,
      // 当前文件对象
      file: {},
      // 上传文件列表
      fileList: [],
      options: [],
      value: "",
    };
  },
  watch: {
    visible(val) {
      //新增visble的监听变更并同步
      this.visibled = val;
    },
  },

  methods: {
    // 获取文件用途
    getFilesUse() {
      getFileUse().then((result) => {
        this.options = result;
      });
    },
    // 上传前的预处理
    beforeUpload(file, fileList) {
      this.fileList = fileList;
      if (this.fileList.length > 1) {
        this.$message.error("一次只能上传一张图片");
        this.fileList.length = 1;
        return false;
      }
      const fileType = file.name
        .substring(file.name.lastIndexOf(".") + 1)
        .toLowerCase();
      const isLtSize = file.size / 1024 / 1024 < 10;
      if (["png", "jpeg", "jpg", "gif"].indexOf(fileType) === -1) {
        this.$message.error("上传图片只能是 JPG、PNG、GIF格式!");
        // 删除当前文件
        this.fileList = [];
        return false;
      }
      if (!isLtSize) {
        this.$message.error(`上传图片大小不能超过 10 MB!`);
        // 删除当前文件
        this.fileList = [];
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
      // 清空当前图片列表
      this.fileList = [];
    },
    // 覆盖默认的上传行为
    requestUpload() {
      let formData = new FormData();
      formData.append("file", this.file.raw);
      formData.append("filePath", this.value);
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

<style lang="scss" scoped>
.use-title {
  font-size: 14px;
  font-weight: 400;
  color: #303133;
}
.use-container {
  display: flex;
  justify-content: center;
  align-items: center;
}
</style>
