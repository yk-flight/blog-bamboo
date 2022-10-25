<template>
  <div class="rightside" :style="isShow">
    <div class="back-container" @click="backTop">
      <svg-icon @click="backTop" icon="rocket-fill" class="top-btn" />
    </div>
  </div>
</template>

<script>
export default {
  mounted() {
    window.addEventListener("scroll", this.scrollToTop);
  },
  destroyed() {
    window.removeEventListener("scroll", this.scrollToTop);
  },
  data: function () {
    return {
      isShow: "",
    };
  },
  methods: {
    // 回到顶部方法
    backTop() {
      window.scrollTo({
        behavior: "smooth",
        top: 0,
      });
    },
    // 为了计算距离顶部的高度，当高度大于100显示回顶部图标，小于100则隐藏
    scrollToTop() {
      const that = this;
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      that.scrollTop = scrollTop;
      if (that.scrollTop > 20) {
        that.isShow = "opacity: 1;transform: translateX(-60px);";
      } else {
        that.isShow = "";
      }
    },
    show() {
      const flag = this.isOut == "rightside-out";
      this.isOut = flag ? "rightside-in" : "rightside-out";
    },
  },
};
</script>

<style scoped>
.back-container {
  font-size: 20px;
  cursor: pointer;
  border-radius: 50%;
  width: 45px;
  height: 45px;
  color: #fff;
  background-color: #409eff;
  text-align: center;
  line-height: 60px;
  border: #fff 1px solid;
}
.top-btn {
  font-size: 28px;
}

.rightside {
  z-index: 4;
  position: fixed;
  right: -50px;
  bottom: 85px;
  transition: all 0.5s;
}
.rightside-config-hide {
  transform: translate(35px, 0);
}
.rightside-out {
  animation: rightsideOut 0.3s;
}
.rightside-in {
  transform: translate(0, 0) !important;
  animation: rightsideIn 0.3s;
}
.rightside-icon:hover {
  background-color: #ff7242;
}
@keyframes rightsideOut {
  0% {
    transform: translate(0, 0);
  }
  100% {
    transform: translate(100px, 0);
  }
}
@keyframes rightsideIn {
  0% {
    transform: translate(100px, 0);
  }
  100% {
    transform: translate(0, 0);
  }
}
</style>
