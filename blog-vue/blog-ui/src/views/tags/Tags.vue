<template>
  <div class="tags-container">
    <div class="tags-header" :style="cover">
      <span class="tags-title">文章标签</span>
    </div>
    <div class="tags-body">
      <h2 style="text-align: center; margin-bottom: 50px; margin-top: 30px">
        文章标签
      </h2>
      <div class="tag-container">
        <router-link
          :to="'/tag/' + item.id"
          class="tag-item"
          v-for="item in tagsList"
          :key="item.id"
        >
          {{ item.name }}
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
import { getTagsList } from "../../api/blog";

export default {
  name: "tags",

  data() {
    return {
      // 标签列表
      tagsList: [],
    };
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取相册页的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "tags") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {
    this.getTagsInfo();
  },

  methods: {
    // 获取标签数据
    getTagsInfo() {
      getTagsList().then((result) => {
        this.tagsList = result.data;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.tags-container {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.tags-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.tags-title {
  color: #fff;
  font-size: 50px;
  font-weight: 500;
}
.tags-body {
  margin-top: 40px;
  width: 70%;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
  padding: 20px;
  min-height: calc(30vh);
}
.tag-container {
  margin: 0px 10%;
  display: flex;

  // display: grid;
  // fr 为网格布局定义的一个新单位。它可以帮助我们摆脱计算百分比，并将可用空间按比例分配
  // grid-template-columns: repeat(8, 1fr);
  // 设置列间距
  // column-gap: 20px;
  // 设置行间距
  // row-gap: 20px;
  a {
    text-decoration: none;
  }
}
.tag-item {
  text-align: center;
  cursor: pointer;
  font-weight: 500;
  font-size: 23px;
  color: #606266;
  margin-left: 10px;
  margin-right: 10px;
}
.tag-item:hover {
  transition: 0.5s;
  font-size: 26px;
  color: #409eff;
}
</style>
