<template>
  <div class="articleList-container">
    <el-card shadow="never">
      <el-tabs v-model="activeName">
        <el-tab-pane label="文章列表" name="articles">
          <articles></articles>
        </el-tab-pane>
        <el-tab-pane label="草稿箱" name="draft-box">这里是草稿箱</el-tab-pane>
        <el-tab-pane label="回收站" name="recycle-bin">
          这里是回收站
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script>
import Articles from "./components/Articles.vue";

export default {
  name: "ArticleList",
  components: { Articles },
  data() {
    return {
      activeName: "articles",
    };
  },

  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.articleList-container {
  margin-top: 10px;
}
</style>
