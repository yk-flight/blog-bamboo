<template>
  <!-- 如果为留言页面则不渲染Footer组件 -->
  <div class="footer-container" v-show="!isMessage">
    <div id="jsi-flying-fish-container" class="fish-cartoon"></div>
    <div class="footer-body">
      <div class="link"></div>
      <div class="footer-custom">
        ©2022 By
        {{ website.author }}
      </div>
      <a
        class="footer-copyright"
        href="https://beian.miit.gov.cn/#/Integrated/index"
        target="_blank"
      >
        {{ website.record }}
      </a>
    </div>
  </div>
</template>

<script>
// 鱼儿跳跃
import "@/assets/js/fish.js";

export default {
  name: "Footer",

  data() {
    return {
      // 网站配置信息
      website: this.$store.getters.website,
    };
  },
  computed: {
    // 判断是否为留言页面
    isMessage() {
      return this.$route.path == "/message";
    },
  },
  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.footer-body {
  margin-bottom: 0;
  height: 120px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  color: #fff;
  // background: rgba(66, 185, 133, 0.6);
  background: #036cd5;
}
.footer-copyright {
  margin-top: 8px;
  margin-bottom: 5px;
  font-size: 14px;
  text-decoration: none;
  color: #fff;
}
.footer-custom {
  font-size: 14px;
}
.fish-cartoon {
  position: relative;
  width: 100%;
  top: 4px;
}
</style>
