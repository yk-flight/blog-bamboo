<template>
  <div class="hamburger-container" @click="setCollapse">
    <svg-icon
      :icon="isCollapse ? 'hamburger-closed' : 'hamburger-opened'"
      class="hamburger"
    ></svg-icon>
  </div>
</template>

<script>
import { mapState, mapMutations } from "vuex";

export default {
  name: "Hamburger",

  computed: {
    ...mapState(["isCollapse"]),
  },

  data() {
    return {};
  },

  mounted() {},

  methods: {
    // 获取vuex中设置菜单是否折叠的方法
    ...mapMutations(["setCollapse"]),
  },
};
</script>

<style lang="scss" scoped>
.hamburger-container {
  padding: 0 16px;
  .hamburger {
    display: inline-block;
    vertical-align: middle;
    width: 20px;
    height: 20px;
  }
}
</style>
