<template>
  <div class="banner-container" :style="cover">
    <div class="banner-body">
      <h1 class="blog-title animate__animated animate__zoomIn">
        {{ website.name }}
      </h1>
      <div>
        <vue-typed-js
          v-if="typingTexts.length > 0"
          :strings="typingTexts"
          :loop="false"
          class="blog-word"
          :startDelay="100"
          :typeSpeed="100"
          :backSpeed="100"
        >
          <span class="typing"></span>
        </vue-typed-js>
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
      typingTexts: [],
      // 网站配置信息
      website: this.$store.getters.website,
    };
  },
  created() {
    this.getWords();
  },
  mounted() {},
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取首页的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "home") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  methods: {
    // 向下滚动
    scrollDown() {
      window.scrollTo({
        behavior: "smooth",
        top: document.documentElement.clientHeight,
      });
    },
    // 获取每日一言
    getWords() {
      this.$axios
        // .get("https://api.fghrsh.net/hitokoto/rand/?encode=jsc&uid=3335")
        .get("https://v1.hitokoto.cn?c=i")
        .then((result) => {
          this.typingTexts.push(result.data.hitokoto);
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
  // background-image: url("../../assets/images/banner.jpg");
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
  font-weight: 500;
  font-size: 1.5rem;
}
</style>
