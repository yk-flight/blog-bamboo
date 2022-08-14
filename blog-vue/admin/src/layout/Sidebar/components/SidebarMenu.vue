<template>
  <div class="sidebar-container">
    <el-menu
      :default-active="activeMenu"
      :unique-opened="false"
      background-color="#304156"
      text-color="#bfcbd9"
      active-text-color="rgb(64, 158, 255)"
      :collapse="this.$store.getters.isCollapse"
      router
    >
      <sidebar-item
        v-for="item in routes"
        :key="item.path"
        :route="item"
      ></sidebar-item>
    </el-menu>
  </div>
</template>

<script>
import SidebarItem from "./SidebarItem.vue";
import { filterRoutes, generateMenus } from "@/utils/route";

export default {
  name: "SidebarMenu",
  components: { SidebarItem },
  data() {
    return {};
  },

  mounted() {},
  computed: {
    activeMenu() {
      const { path } = this.$route;
      return path;
    },
    // 监视当路由是否发生变化
    routes() {
      const filteRoutes = filterRoutes(this.$router.options.routes);
      return generateMenus(filteRoutes);
    },
  },
  methods: {},
};
</script>

<style lang="scss" scoped>
.sidebar-container {
  margin-top: 76px;
  width: 100%;
}
</style>
