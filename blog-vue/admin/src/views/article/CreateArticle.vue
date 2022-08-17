<template>
  <div class="create-container">
    <div class="article-title">
      <el-input placeholder="请输入文章标题" v-model="title"></el-input>
    </div>

    <mavon-editor
      v-model="context"
      @imgAdd="$imgAdd"
      @imgDel="$imgDel"
      :toolbars="toolbars"
      class="article-content"
    />
  </div>
</template>

<script>
export default {
  name: "CreateArticle",

  data() {
    return {
      // 博客标题
      title: "",
      // 博客文本数据
      context: "",
      toolbars: {
        bold: true, // 粗体
        italic: true, // 斜体
        header: true, // 标题
        underline: true, // 下划线
        mark: true, // 标记
        superscript: true, // 上角标
        quote: true, // 引用
        ol: true, // 有序列表
        ul: true, // 无序列表
        table: true, // 表格
        link: true, // 链接
        imagelink: true, // 图片链接
        help: true, // 帮助
        code: true, // code
        subfield: true, // 是否需要分栏
        readmodel: true, // 沉浸式阅读
        /* 1.3.5 */
        undo: true, // 上一步
        trash: true, // 清空
        save: true, // 保存（触发events中的save事件）
        /* 1.4.2 */
        navigation: true, // 导航目录
      },
    };
  },

  mounted() {},

  methods: {
    // 绑定@imgAdd event
    $imgAdd() {
      console.log("添加图片");
    },
    $imgDel() {
      console.log("删除图片");
    },
  },
};
</script>

<style lang="scss" scoped>
.create-container {
  margin-top: 10px;

  .article-title {
    margin-bottom: 10px;
  }

  .article-content {
    margin-top: 20px;
    height: 700px;
  }
}
</style>
