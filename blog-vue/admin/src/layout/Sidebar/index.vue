<template>
  <div>
    <div class="logo-container">
      <el-avatar
        :size="44"
        shape="circle"
        src="https://www.zrkizzy.com/upload/2021/11/header-90431fbd9cf848e2a5aaea0bf6b1089b.jpg"
      ></el-avatar>
      <h1 class="logo-title" v-if="!isCollapse">后台管理系统</h1>
    </div>
    <!-- 处理 menu 菜单过长时的情况 -->
    <!-- <el-scrollbar> -->
    <sidebar-menu></sidebar-menu>
    <!-- </el-scrollbar> -->
  </div>
</template>

<script>
import { mapState } from "vuex";
import SidebarMenu from "./components/SidebarMenu";

export default {
  name: "Sidebar",
  components: { SidebarMenu },
  data() {
    return {};
  },
  computed: {
    ...mapState(["isCollapse"]),
  },
  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.logo-container {
  height: "76px";
  padding: 10px 0 22px 0;
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: rgb(48, 65, 86);

  .logo-title {
    margin-left: 10px;
    color: #fff;
    font-weight: 600;
    line-height: 50px;
    font-size: 16px;
    white-space: nowrap;
  }

  .el-avatar {
    --el-avatar-background-color: none;
  }
}
</style>
