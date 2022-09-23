<template>
  <!-- 带有切换动画，并且具备组件缓存的 -->
  <div>
    <transition name="fade-transform" mode="out-in">
      <!-- 将创建文章页面开启组件缓存 -->
      <keep-alive include="CreateArticle">
        <!-- 绑定唯一路由，Vue就会认为每个内部路由都是不同的，在跳转时便会强制刷新组件 -->
        <router-view :key="$route.fullPath" />
      </keep-alive>
    </transition>
  </div>
</template>

<script>
import { isTags } from "@/utils/tags";

export default {
  name: "Main",

  data() {
    return {};
  },

  mounted() {},

  watch: {
    $route(to, from) {
      this.addTagsViewList(to);
    },
  },
  methods: {
    // 添加到标签栏
    addTagsViewList(to) {
      // 并不是所有的路由都不需要保存
      if (!isTags(to.path)) return;
      // 从 to 中解构出想要的属性
      const { fullPath, meta, name, params, path, query } = to;
      this.$store.commit("app/addTagsViewList", {
        fullPath,
        meta,
        name,
        params,
        path,
        query,
        title: this.$route.name,
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.main-container {
  margin: 0;
  padding: 0;
  width: 0;
  height: 0;
}
</style>
