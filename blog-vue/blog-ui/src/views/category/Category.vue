<template>
  <div class="category-container">
    <div class="category-header" :style="cover">
      <span class="category-title">文章分类</span>
    </div>
    <div class="category-body">
      <h2 style="text-align: center; margin-bottom: 50px; margin-top: 30px">
        文章分类
      </h2>
      <hr style="margin-top: 30px" width="80%" color="#DCDFE6" size="1" />
      <!-- 分类子项 -->
      <div class="category-item" v-for="item in categoryList" :key="item.id">
        <div class="article-container">
          <router-link :to="'/category/' + item.id" class="title-span">
            <img :src="item.image" class="category-img" />
          </router-link>
          <div class="article-body">
            <div style="margin-top: 15px">
              <router-link :to="'/category/' + item.id" class="title-span">
                {{ item.name }}
              </router-link>
            </div>
            <div style="margin-top: 5px">
              <span class="num-span">
                当前分类有
                {{ item.articleAmount }}
                篇文章
              </span>
            </div>
          </div>
        </div>
        <hr style="margin-top: 30px" width="80%" color="#DCDFE6" size="1" />
      </div>

      <!-- 分页组件 -->
      <div style="text-align: center; margin: 30px 0">
        <paginate
          :page-count="pageCount"
          :prev-text="'上一页'"
          :next-text="'下一页'"
          :container-class="'paginate'"
          :page-class="'page-item'"
          :prev-class="'prev-item'"
          :prev-link-class="'prev-link-item'"
          :next-link-class="'next-link-item'"
          :active-class="'paginate-active'"
          :click-handler="handleClick"
        >
        </paginate>
      </div>
    </div>
  </div>
</template>

<script>
import { getCategoryList } from "../../api/blog";

export default {
  name: "Category",

  data() {
    return {
      // 文章分类数据
      categoryList: [],
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 文章最大页数
      pageCount: 0,
    };
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取分类页的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "category") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {
    this.getCategoryInfo();
  },

  methods: {
    getCategoryInfo() {
      getCategoryList({
        curPage: this.curPage,
        size: this.size,
      }).then((result) => {
        let data = result.data;
        this.categoryList = data.list;
        this.pageCount = Math.ceil(data.total / this.size);
      });
    },
    // 点击页面切换按钮后执行的事件
    handleClick(e) {
      // 传来的参数为当前页数
      this.curPage = e;
      this.getCategoryInfo();
    },
  },
};
</script>

<style lang="scss" scoped>
.category-container {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.category-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.category-title {
  color: #fff;
  font-size: 50px;
  font-weight: 500;
}
.category-body {
  margin-top: 40px;
  width: 70%;
  min-height: calc(30vh);
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
  padding: 20px;
}
.category-item {
  padding-top: 10px;
  width: 100%;
  border-radius: 5px;
}

.article-container {
  margin-top: 10px;
  margin-bottom: 10px;
  display: flex;
  padding-left: 10%;
  width: 80%;
  a {
    text-decoration: none;
  }
}
.article-body {
  margin-left: 20px;
}
.article-date {
  margin-top: 5px;
  margin-bottom: 8px;
}
.title-span {
  cursor: pointer;
  font-size: 15px;
  color: #303133;
  font-weight: 600;
}
.num-span {
  font-size: 13px;
  color: #909399;
  font-weight: 500;
}
.title-span:hover {
  transition: 0.8s;
  color: #409eff;
}
.article-title {
  font-size: 16px;
  color: #606266;
  font-weight: 600;
}
.category-img {
  width: 120px;
  border: #303133 1px solid;
}
.category-img:hover {
  opacity: 0.8;
  transition: 0.5s;
  transform: scale(1.2);
}
</style>
