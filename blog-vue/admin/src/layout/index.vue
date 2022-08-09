<template>
  <div style="height: 100%">
    <el-container>
      <el-header>头部导航栏</el-header>
      <el-container>
        <el-aside width="210px">
          <!-- 侧边栏 -->
          <sidebar></sidebar>
        </el-aside>
        <el-main>
          <transition name="fade-transform" mode="out-in">
            <router-view />
          </transition>
        </el-main>
      </el-container>
    </el-container>
  </div>
</template>

<script>
import Sidebar from "./Sidebar/index";

export default {
  name: "Layout",
  components: { Sidebar },
  data() {
    return {};
  },
};
</script>

<style>
.el-container {
  height: 100%;
}
.el-header {
  background-color: #242f42;
  text-align: center;
  line-height: 60px;
}

.el-aside {
  width: 100%;
  background-color: #304156;
}

.el-main {
  background-color: #e9eef3;
  text-align: center;
}
</style>
