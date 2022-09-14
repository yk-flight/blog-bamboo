<template>
  <div class="create-container">
    <div class="article-title">
      <el-row :gutter="20">
        <el-col :span="20">
          <el-input placeholder="请输入文章标题" v-model="title"></el-input>
        </el-col>
        <el-col :span="4">
          <el-button type="danger">保存草稿</el-button>
          <el-button type="primary" @click="showDrawer">发布文章</el-button>
        </el-col>
      </el-row>
    </div>
    <!-- 博客区域 -->
    <mavon-editor
      v-model="context"
      @imgAdd="$imgAdd"
      @imgDel="$imgDel"
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

export default {
  name: "CreateArticle",

  data() {
    return {
      // 博客标题
      title: "",
      // 博客文本数据
      context: "",
      // 抽屉是否展示
      drawerVisible: false,
    };
  },

  mounted() {
    this.title = this.dateFormat(new Date());
  },

  methods: {
    // 绑定添加图片调用的方法
    $imgAdd() {
      console.log("添加图片");
    },
    // 删除图片调用的方法
    $imgDel() {
      console.log("删除图片");
    },
    // 打开抽屉对话框
    showDrawer() {
      this.drawerVisible = true;
    },
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
