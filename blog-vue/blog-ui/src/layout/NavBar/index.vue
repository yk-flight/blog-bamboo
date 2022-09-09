<template>
  <div class="navbar-container">
    <div class="navbar-left">
      <img
        src="https://www.zrkizzy.com/upload/2021/11/header-90431fbd9cf848e2a5aaea0bf6b1089b.jpg"
        class="logo"
      />
      <router-link to="/" class="navbar-title">世纪末的架构师</router-link>
    </div>
    <div class="navbar-right">
      <div class="menu-item">
        <router-link class="menu-btn" to="/">
          <svg-icon icon="home"></svg-icon> 首页
        </router-link>
        <i class="icon-item"></i>
      </div>
      <div class="menu-item">
        <router-link class="menu-btn" to="/archive">
          <svg-icon icon="tags"></svg-icon> 归档
        </router-link>
      </div>
      <div class="menu-item">
        <router-link class="menu-btn" to="/category">
          <svg-icon icon="bxs-category"></svg-icon> 分类
        </router-link>
      </div>
      <div class="menu-item">
        <router-link class="menu-btn" to="/">
          <svg-icon icon="log"></svg-icon> 日志
        </router-link>
      </div>
      <div class="menu-item">
        <router-link class="menu-btn" to="/">
          <svg-icon icon="picture"></svg-icon> 相册
        </router-link>
      </div>
      <div class="menu-item">
        <router-link class="menu-btn" to="/">
          <svg-icon icon="friend-link"></svg-icon> 友链
        </router-link>
      </div>
      <div class="menu-item">
        <router-link class="menu-btn" to="/about">
          <svg-icon icon="guide"></svg-icon> 关于我
        </router-link>
      </div>
      <div class="menu-item">
        <router-link class="menu-btn" to="/about">
          <svg-icon icon="message"></svg-icon> 留言
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "NavBar",

  data() {
    return {};
  },

  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.logo {
  border-radius: 50%;
  width: 40px;
  height: 40px;
  margin-right: 10px;
  margin-left: 20px;
}
.navbar-left {
  display: flex;
  justify-content: space-between;
  margin-top: 10px;
  cursor: pointer;
}

.navbar-right {
  margin-right: 20px;
}
.menu-item {
  position: relative;
  display: inline-block;
  margin-top: 15px;
  margin-right: 15px;
}
.navbar-title {
  font-size: 18px;
  font-weight: 500;
  line-height: 35px;
  margin-left: 10px;
}

.menu-item a {
  transition: all 0.2s;
}
.nav-fixed .menu-btn:hover {
  // color: rgba(66, 185, 133, 0.8) !important;
  color: #fff !important;
}
.menu-btn:hover:after {
  width: 100%;
}
.menu-item a:after {
  position: absolute;
  bottom: -5px;
  left: 0;
  z-index: -1;
  width: 0;
  height: 3px;
  // background-color: rgba(66, 185, 133, 0.8);
  background-color: #fff;
  content: "";
  transition: all 0.3s ease-in-out;
}
</style>
