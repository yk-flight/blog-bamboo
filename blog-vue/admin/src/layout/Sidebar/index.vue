<template>
  <div class="layout-container">
    <!-- 处理 menu 菜单过长时的情况 -->
    <sidebar-menu></sidebar-menu>
  </div>
</template>

<script>
import SidebarMenu from "./SidebarMenu";

export default {
  name: "Sidebar",
  components: { SidebarMenu },
  data() {
    return {};
  },

  mounted() {},

  methods: {},
};
</script>

<style lang="less">
.layout-container {
  position: relative;
  height: 100%;
  width: 100%;
}
</style>
