<template>
  <div id="app">
    <!--  顶部导航栏  -->
    <NavBar></NavBar>
    <!-- 博客内容 -->
    <transition name="fade-transform" mode="out-in">
      <router-view />
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
};
</script>
