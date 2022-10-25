<template>
  <div :class="navClass">
    <div class="navbar-left">
      <router-link to="/" class="left-container">
        <img :src="website.logo" class="logo" />
        <span class="navbar-title">{{ website.author }}</span>
      </router-link>
    </div>
    <div class="navbar-right">
      <div
        class="menu-item"
        v-for="navbar in navBarList"
        :key="navbar.id"
        v-show="navbar.label != 'articleList'"
      >
        <router-link class="menu-btn" :to="navbar.path">
          <svg-icon :icon="navbar.label"></svg-icon>
          {{ navbar.title }}
        </router-link>
        <i class="icon-item"></i>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "NavBar",

  data() {
    return {
      navClass: "navbar-container",
      i: 0,
      navBarList: this.$store.getters.navBarList,
      // 网站配置信息
      website: this.$store.getters.website,
    };
  },
  mounted() {
    window.addEventListener("scroll", this.scroll);
  },

  methods: {
    // 顶部滚动样式
    scroll() {
      const _this = this;
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      var scroll = scrollTop - this.i;
      this.i = scrollTop;
      if (scroll < 0) {
        // 鼠标上滚  执行的的方法
        _this.navClass = "navbar-container-scroll";
      } else {
        // 鼠标下滚  执行的的方法
        _this.navClass = "navbar-hidden";
      }
      if (scrollTop == 0) {
        _this.navClass = "navbar-container";
      }
      // if (_this.scrollTop > 0) {
      //   _this.navClass = "navbar-container-scroll";
      // } else {
      //   _this.navClass = "navbar-container";
      // }
    },
  },
};
</script>

<style lang="scss" scoped>
.navbar-container {
  height: 50px;
  position: fixed;
  top: 0;
  display: flex;
  justify-content: space-between;
  width: 100%;
  text-align: center;
  color: #fff;
  z-index: 1;
  transition: 1s;
  a {
    color: #fff;
    text-decoration: none;
  }
}
.navbar-hidden {
  height: 50px;
  position: fixed;
  top: 0;
  display: flex;
  justify-content: space-between;
  width: 100%;
  text-align: center;
  color: #fff;
  z-index: -1;
  transition: 1s;
  a {
    color: #fff;
    text-decoration: none;
  }
  opacity: 0;
  transition: 0.8s;
}
.svg-icon {
  margin-right: 2px;
  font-size: 12px;
}
.logo {
  border-radius: 50%;
  width: 40px;
  height: 40px;
  margin-right: 10px;
  margin-left: 20px;
  transition: all 0.5s;
}
.logo:hover {
  transform: rotate(360deg);
}
.navbar-left {
  display: flex;
  align-items: center;
  cursor: pointer;
}

.navbar-right {
  margin-right: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}
.menu-item {
  font-weight: 800;
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-left: 12px;
}
.navbar-title {
  font-size: 18px;
  font-weight: 700;
  margin-left: 10px;
  line-height: 40px;
}
.left-container {
  display: flex;
  justify-content: space-between;
}
.menu-item a {
  transition: all 0.2s;
}
.nav-fixed .menu-btn:hover {
  // color: rgba(66, 185, 133, 0.8) !important;
  color: #fff !important;
}
.menu-btn {
  font-size: 16px;
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
  background-color: #409eff;
  content: "";
  transition: all 0.3s ease-in-out;
}
.navbar-container-scroll {
  opacity: 0.8;
  background-color: #f2f6fc;
  height: 50px;
  position: fixed;
  top: 0;
  display: flex;
  justify-content: space-between;
  width: 100%;
  text-align: center;
  z-index: 1;
  a {
    color: #303133;
    text-decoration: none;
  }
  transition: 0.8s;
}
</style>
