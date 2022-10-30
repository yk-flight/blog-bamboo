<template>
  <div class="photo-container">
    <div class="photo-header" :style="cover">
      <span class="photo-title">精选相册</span>
    </div>
    <div class="photo-body">
      <div class="photo-item" v-for="item in photos" :key="item.id">
        <router-link :to="'/photo/' + item.id">
          <img class="photo-cover" :src="item.image" />
          <div class="photo-desc">
            <h3>{{ item.name }}</h3>
            <span style="margin-top: 5px; font-size: 14px">
              {{ item.description }}
            </span>
          </div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { listPhotos } from "../../api/blog";

export default {
  name: "Photo",

  data() {
    return {
      // 所有相册集合
      photos: [],
    };
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
  mounted() {
    this.getPhotos();
  },

  methods: {
    // 获取相册
    getPhotos() {
      listPhotos().then((result) => {
        this.photos = result.data;
      });
    },
  },
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
  padding: 40px 30px;
  min-height: calc(30vh);
  display: grid;
  // fr 为网格布局定义的一个新单位。它可以帮助我们摆脱计算百分比，并将可用空间按比例分配
  grid-template-columns: repeat(3, 1fr);
  // 设置列间距
  column-gap: 10px;
  // 设置行间距
  row-gap: 10px;
}
.photo-cover {
  width: 100%;
  height: 100%;
  opacity: 0.6;
  transition: all 0.6s;
  object-fit: cover;
}
.photo-item {
  position: relative;
  display: inline-block;
  overflow: hidden;
  height: 220px;
  background: #000;
  border-radius: 8px;
}
.photo-item:hover .photo-cover {
  opacity: 0.8;
  transform: scale(1.1);
}
.photo-desc {
  position: absolute;
  color: #fff;
  top: 20px;
  left: 30px;
  display: flex;
  // align-items: center;
  flex-direction: column;
  // justify-content: center;
}
</style>
