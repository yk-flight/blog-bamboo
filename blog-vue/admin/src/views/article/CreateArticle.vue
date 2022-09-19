<template>
  <div class="create-container">
    <div class="article-title">
      <el-row :gutter="20">
        <el-col :span="20">
          <el-input placeholder="请输入文章标题" v-model="title"></el-input>
        </el-col>
        <el-col :span="4">
          <el-button type="danger" @click="saveDraft">保存草稿</el-button>
          <el-button type="primary" @click="showDrawer">发布文章</el-button>
        </el-col>
      </el-row>
    </div>
    <!-- 博客区域 -->
    <!-- 如果需要使用到文章内容的HTML格式则添加该配置 @change="changeHtml" -->
    <mavon-editor
      ref="mdedit"
      v-model="content"
      @imgAdd="handleImgAdd"
      @imgDel="handleImgDel"
      class="article-content"
    />

    <!--  文章信息抽屉  -->
    <el-drawer
      title="文章设置"
      :visible.sync="drawerVisible"
      :wrapperClosable="false"
    >
      <span>我来啦!</span>
    </el-drawer>
  </div>
</template>

<script>
import dayjs from "dayjs";
import { upload } from "@/api/picture";
import { deleteFileByPath } from "@/api/file";

export default {
  name: "CreateArticle",

  data() {
    return {
      // 博客标题
      title: "",
      // 博客文本数据
      content: "",
      // 博客文本HTML数据
      // contentHtml: "",
      // 抽屉是否展示
      drawerVisible: false,
    };
  },

  mounted() {
    this.title = this.dateFormat(new Date());
  },

  methods: {
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
    // 打开抽屉对话框
    showDrawer() {
      this.drawerVisible = true;
    },
    // 保存草稿箱事件
    saveDraft() {
      console.log(this.content);
    },
    // 获取markdowm解析后的结果
    // changeHtml(value, render) {
    //   this.contentHtml = render;
    // },
    // 格式化时间
    dateFormat(date) {
      // 使用 dayjs 处理时间
      return dayjs(date).format("YYYY-MM-DD hh:ss");
    },
  },
};
</script>

<style lang="scss" scoped>
.create-container {
  margin-top: 10px;

  .article-title {
    width: 100%;
    margin-bottom: 10px;
  }

  .article-content {
    margin-top: 20px;
    height: calc(100vh - 200px);
  }
}
</style>
