<template>
  <div>
    <div
      :class="
        isError
          ? 'toast-error animate__animated animate__fadeInDown'
          : 'toast-primary animate__animated animate__fadeInDown'
      "
      v-show="visible"
    >
      <span>{{ content }}</span>
    </div>
  </div>
</template>

<script>
export default {
  name: "Toast",
  data() {
    return {
      visible: false,
      content: "",
      // 异常对话框
      isError: false,
    };
  },
  mounted() {},
  methods: {
    toast(str) {
      let that = this;
      that.content = str;
      that.visible = true;
      setTimeout(function () {
        that.visible = false;
      }, 2000);
    },
    binxs(val) {
      this.isError = false;
      this.toast(val);
    },
    error(val) {
      this.isError = true;
      this.toast(val);
    },
  },
};
</script>

<style lang="scss" scoped>
.toast-primary {
  position: fixed;
  z-index: 2;
  left: 40%;
  top: 30px;
  transition: all 0.5s;
  -webkit-transform: translateX(-50%) translateY(-50%);
  -moz-transform: translateX(-50%) translateY(-50%);
  -ms-transform: translateX(-50%) translateY(-50%);
  -o-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
  text-align: center;
  border-radius: 5px;
  color: #fff;
  // background: rgba(17, 17, 17, 0.7);
  background: #40a0ffef;
  font-weight: 600;
  height: 40px;
  line-height: 40px;
  padding: 0px 50px;
}
.toast-error {
  position: fixed;
  z-index: 2;
  left: 40%;
  top: 30px;
  transition: all 0.5s;
  -webkit-transform: translateX(-50%) translateY(-50%);
  -moz-transform: translateX(-50%) translateY(-50%);
  -ms-transform: translateX(-50%) translateY(-50%);
  -o-transform: translateX(-50%) translateY(-50%);
  transform: translateX(-50%) translateY(-50%);
  text-align: center;
  border-radius: 5px;
  color: #fff;
  // background: rgba(17, 17, 17, 0.7);
  background: #f56c6cef;
  font-weight: 600;
  height: 40px;
  line-height: 40px;
  padding: 0px 50px;
}
</style>
