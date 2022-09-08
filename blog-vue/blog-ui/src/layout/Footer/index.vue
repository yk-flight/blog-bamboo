<template>
  <div class="footer-container">
    <div id="jsi-flying-fish-container" class="fish-cartoon"></div>
    <div class="footer-body">
      <div class="link"></div>
      <div class="footer-custom">©2022 By 世纪末的架构师</div>
      <div class="footer-copyright">晋ICP备2021018904号</div>
    </div>
  </div>
</template>

<script>
// 鱼儿跳跃
import "@/assets/js/fish.js";

export default {
  name: "Footer",

  data() {
    return {};
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
  background: rgba(66, 185, 133, 0.6);
}
.footer-copyright {
  margin-top: 8px;
  margin-bottom: 5px;
  font-size: 14px;
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
