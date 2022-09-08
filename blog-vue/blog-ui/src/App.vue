<template>
  <div id="app">
    <!--  顶部导航栏  -->
    <NavBar></NavBar>
    <!-- 博客内容 -->
    <router-view />
    <!--  博客页脚  -->
    <Footer></Footer>
    <!--  返回顶部  -->
    <BackTop></BackTop>
  </div>
</template>

<script>
import NavBar from "@/layout/NavBar/index.vue";
import Footer from "@/layout/Footer/index.vue";
import BackTop from "@/components/BackTop/index.vue";

export default {
  components: { NavBar, Footer, BackTop },
};
</script>
