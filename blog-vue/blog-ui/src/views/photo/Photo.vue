<template>
  <div class="photo-container">
    <div class="photo-header" :style="cover">
      <span class="photo-title">精选相册</span>
    </div>
    <div class="photo-body"></div>
  </div>
</template>

<script>
export default {
  name: "Photo",

  data() {
    return {};
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取相册页的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "photo") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.photo-container {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.photo-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.photo-title {
  color: #fff;
  font-size: 50px;
  font-weight: 500;
}
.photo-body {
  margin-top: 40px;
  width: 70%;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
  padding: 20px;
  min-height: calc(30vh);
}
</style>
