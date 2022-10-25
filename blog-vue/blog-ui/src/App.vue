<template>
  <div id="app">
    <!--  顶部导航栏  -->
    <NavBar></NavBar>
    <!-- 博客内容 -->
    <transition name="fade-transform" mode="out-in">
      <router-view :key="$route.fullPath" />
    </transition>
    <!--  返回顶部  -->
    <BackTop></BackTop>
    <!--  博客页脚  -->
    <Footer></Footer>
  </div>
</template>

<script>
import NavBar from "@/layout/NavBar/index.vue";
import Footer from "@/layout/Footer/index.vue";
import BackTop from "@/components/BackTop/index.vue";

export default {
  components: { NavBar, Footer, BackTop },
  created() {
    // 获取博客信息
    this.getBlogInfo();
  },
  methods: {
    getBlogInfo() {
      // 获取博客顶部导航栏信息
      this.getNavBarList();
      // 获取博客基本配配置信息
      this.getBlogConfig();
    },
    // 获取顶部导航栏
    getNavBarList() {
      this.$store.dispatch("navbar/getNavBarList");
    },
    // 博客配置信息
    getBlogConfig() {
      this.$store.dispatch("config/getBlogConfig");
    },
  },
};
</script>
