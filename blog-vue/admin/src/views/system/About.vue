<template>
  <div class="about-container">
    <!-- 博客区域 -->
    <mavon-editor
      ref="mdedit"
      v-model="about.content"
      @imgAdd="handleImgAdd"
      @imgDel="handleImgDel"
      class="article-content"
    />
    <!-- 上一次更新时间 -->
    <div class="about-header">
      <span class="update-title">
        上次更新时间：
        {{ about.createTime | dateFilter }}
      </span>
      <el-button type="primary" size="mini" @click="updateAbout">
        修改
      </el-button>
    </div>
  </div>
</template>

<script>
import { upload } from "@/api/picture";
import { deleteFileByPath } from "@/api/file";
import { getAboutInfo, updateAboutInfo } from "@/api/about";

export default {
  name: "About",

  data() {
    return {
      // 关于我
      about: {
        // 内容
        content: "",
        // 上一次更新时间
        updateTime: "",
      },
    };
  },

  mounted() {
    this.getData();
  },

  methods: {
    // 获取关于我信息
    getData() {
      getAboutInfo().then((result) => {
        this.about = result;
      });
    },
    // 更新关于我数据
    updateAbout() {
      updateAboutInfo(this.about).then(() => {
        this.getData();
      });
    },
    // 绑定添加图片调用的方法
    handleImgAdd(pos, $file) {
      let formData = new FormData();
      formData.append("file", $file);
      formData.append("filePath", "article/");
      upload(formData).then((result) => {
        // 替换上传文件的回显路径
        this.$refs.mdedit.$img2Url(pos, result);
      });
    },
    // 删除图片调用的方法
    handleImgDel(pos) {
      // markdown中的图片是一个数组，可以直接通过pos[0]取出图片路径
      deleteFileByPath({ path: pos[0] }).then(() => {});
    },
  },
};
</script>

<style lang="scss" scoped>
.about-container {
  margin-top: 10px;
}
.article-content {
  height: calc(100vh - 180px);
}
.about-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 20px;
}
.update-title {
  margin-right: 10px;
  color: #606266;
  font-size: 14px;
  font-weight: 500;
}
</style>
