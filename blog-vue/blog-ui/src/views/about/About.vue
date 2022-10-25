<template>
  <div class="about-container">
    <div class="about-header" :style="cover">
      <span class="about-title">关于我</span>
    </div>
    <div class="about-body">
      <article ref="about" v-html="content" class="markdown-body" />
    </div>
  </div>
</template>

<script>
import markdownToHtml from "../../utils/markdownToHtml";
import { getAboutInfo } from "../../api/blog";

export default {
  name: "About",

  data() {
    return {
      content: "",
      // 图片预览
      imgList: [],
    };
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取关于我页面的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "about") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  created() {
    this.getAboutData();
  },

  methods: {
    getAboutData() {
      const that = this;
      getAboutInfo().then((result) => {
        let data = result.data;
        this.content = data.content;
        //将markdown转换为Html
        this.content = markdownToHtml(this.content);
        // 防止 HTMLCollection 中有元素但 length 为 0 的情况出现
        this.$nextTick(function () {
          // 添加图片预览功能
          const imageList = this.$refs.about.getElementsByTagName("img");
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
.about-container {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.about-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.about-title {
  color: #fff;
  font-size: 50px;
  font-weight: 500;
}
.about-body {
  margin-top: 40px;
  width: 70%;
  border-radius: 10px;
  background-color: #fff;
  min-height: calc(30vh);
}
.markdown-body {
  padding: 25px;
}
</style>

<style lang="scss">
pre.hljs {
  padding: 12px 2px 12px 40px !important;
  border-radius: 5px !important;
  position: relative;
  font-size: 14px !important;
  line-height: 22px !important;
  overflow: hidden !important;
  &:hover .copy-btn {
    display: flex;
    justify-content: center;
    align-items: center;
  }
  background-color: #272822;
  code {
    display: block !important;
    margin: 0 10px !important;
    overflow-x: auto !important;
    &::-webkit-scrollbar {
      z-index: 11;
      width: 6px;
    }
    &::-webkit-scrollbar:horizontal {
      height: 6px;
    }
    &::-webkit-scrollbar-thumb {
      border-radius: 5px;
      width: 6px;
      background: #666;
    }
    &::-webkit-scrollbar-corner,
    &::-webkit-scrollbar-track {
      background: #1e1e1e;
    }
    &::-webkit-scrollbar-track-piece {
      background: #1e1e1e;
      width: 6px;
    }
  }
  .line-numbers-rows {
    position: absolute;
    pointer-events: none;
    top: 12px;
    bottom: 12px;
    left: 0;
    font-size: 100%;
    width: 40px;
    text-align: center;
    letter-spacing: -1px;
    border-right: 1px solid rgba(0, 0, 0, 0.66);
    user-select: none;
    counter-reset: linenumber;
    span {
      pointer-events: none;
      display: block;
      counter-increment: linenumber;
      &:before {
        content: counter(linenumber);
        color: #999;
        display: block;
        text-align: center;
      }
    }
  }
  b.name {
    position: absolute;
    top: 7px;
    right: 45px;
    z-index: 1;
    color: #999;
    pointer-events: none;
  }
  .copy-btn {
    position: absolute;
    top: 6px;
    right: 6px;
    z-index: 1;
    color: #ccc;
    background-color: #525252;
    border-radius: 6px;
    display: none;
    font-size: 14px;
    width: 32px;
    height: 24px;
    outline: none;
  }
}
</style>
