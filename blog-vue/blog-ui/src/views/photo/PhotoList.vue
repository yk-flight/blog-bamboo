<template>
  <div class="photoList-container">
    <div class="photoList-header" :style="cover">
      <span class="photoList-title"> {{ photos.name }}</span>
    </div>
    <div class="photoList-body" ref="photos">
      <div
        class="photoList-item"
        v-for="item in photos.children"
        :key="item.id"
      >
        <img :src="item.image" class="photo-cover" />
      </div>
    </div>
  </div>
</template>

<script>
import { listPhotoById } from "../../api/blog";

export default {
  name: "PhotoList",

  data() {
    return {
      photos: {},
      // 图片预览
      imgList: [],
    };
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = this.photos.image;
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {
    this.getPhotoList();
  },

  methods: {
    // 获取相册列表
    getPhotoList() {
      const that = this;
      let id = this.$route.params.id;
      listPhotoById(id).then((result) => {
        this.photos = result.data;
        // 修改浏览器标题
        window.document.title = this.photos.name;
        // 防止 HTMLCollection 中有元素但 length 为 0 的情况出现
        this.$nextTick(function () {
          // 添加图片预览功能
          const imageList = this.$refs.photos.getElementsByTagName("img");
          for (var i = 0; i < imageList.length; i++) {
            this.imgList.push(imageList[i].src);
            imageList[i].addEventListener("click", function (e) {
              that.previewImg(e.target.currentSrc);
            });
          }
        });
      });
    },
    // 图片预览方法
    previewImg(img) {
      this.$imagePreview({
        images: this.imgList,
        index: this.imgList.indexOf(img),
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.photoList-container {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
  a {
    text-decoration: none;
    // color: #303133;
  }
}
.photoList-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.photoList-title {
  color: #fff;
  font-size: 45px;
  font-weight: 500;
}
.photoList-body {
  margin-top: 40px;
  padding: 20px 40px;
  width: 70%;
  border-radius: 10px;
  padding: 20px;
  min-height: calc(30vh);
  display: grid;
  // fr 为网格布局定义的一个新单位。它可以帮助我们摆脱计算百分比，并将可用空间按比例分配
  grid-template-columns: repeat(2, 1fr);
  // 设置列间距
  column-gap: 10px;
  // 设置行间距
  row-gap: 10px;
  box-shadow: 0 1px 10px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
}
.photoList-item {
  width: 100%;
  height: 320px;
  border-radius: 8px;
}
.photo-cover {
  width: 100%;
  height: 100%;
  object-fit: cover;
}
</style>
