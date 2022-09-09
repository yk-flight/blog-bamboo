<template>
  <div class="banner-container">
    <div class="banner-body">
      <h1 class="blog-title animate__animated animate__zoomIn">
        世纪末的架构师
      </h1>
      <div>
        <!-- :loop="true" -->

        <vue-typed-js
          :strings="typingTexts"
          class="blog-word"
          :startDelay="300"
          :typeSpeed="100"
          :backSpeed="100"
        >
          <!-- <span
            class="blog-word animate__animated animate__slideInRight"
          ></span> -->
          <span class="typing"></span>
        </vue-typed-js>
        <!-- <span class="typed-cursor animate__animated animate__bounceIn">
          |
        </span> -->
      </div>
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
    return {
      typingTexts: ["数风流人物，还看今朝"],
    };
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
  width: 100%;
  height: calc(100vh);
  background-size: 100% 100%;
  background-image: url("../../assets/images/banner-2.jpg");
}
.banner-body {
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
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
  font-size: 1.7rem;
}
</style>
