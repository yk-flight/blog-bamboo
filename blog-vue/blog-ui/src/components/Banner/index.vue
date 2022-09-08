<template>
  <div class="banner-container">
    <div class="banner-body">
      <h1 class="blog-title animate__animated animate__slideInRight">
        世纪末的架构师
      </h1>
      <span class="blog-word animate__animated animate__slideInRight">
        长风破浪会有时，直挂云帆济沧海
      </span>
      <span class="typed-cursor animate__animated animate__bounceIn"> | </span>
    </div>
    <div
      class="scroll-down animate__animated animate__fadeInDown"
      @click="scrollDown"
    >
      <svg-icon icon="down"></svg-icon>
    </div>
  </div>
</template>

<script>
export default {
  name: "Banner",

  data() {
    return {};
  },

  mounted() {},

  methods: {
    // 向下滚动
    scrollDown() {
      window.scrollTo({
        behavior: "smooth",
        top: document.documentElement.clientHeight,
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.banner-container {
  overflow: hidden;
  background-size: 100% 100%;
  width: 100%;
  height: 100%;
  background-image: url("../../assets/images/banner-2.jpg");
}
.banner-body {
  text-align: center;
  margin-top: 20%;
}
.blog-title {
  color: white;
  font-size: 2.8rem;
  line-height: 1.5em;
  max-height: none;
}
.blog-word {
  color: white;
  font-weight: 400;
  font-size: 1.8rem;
  max-height: none;
}
</style>
