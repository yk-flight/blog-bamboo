<template>
  <div class="articleList-container">
    <div class="articleList-header" :style="cover">
      <span class="articleList-title"> {{ title }} - {{ name }}</span>
    </div>
    <div class="articleList-body">
      <div class="articleList-item" v-for="item in articleList" :key="item.id">
        <router-link :to="'/article/' + item.id">
          <div class="article-header">
            <img
              :src="item.background"
              width="100%"
              height="100%"
              class="on-hover"
            />
          </div>
        </router-link>
        <div class="article-body">
          <router-link :to="'/article/' + item.id" class="title">
            {{ item.title }}
          </router-link>
          <div class="info">
            <span class="info-item">
              <svg-icon icon="date"></svg-icon>
              {{ item.publishTime | date }}
            </span>
            <router-link :to="'/category/' + item.category" class="info-item">
              <svg-icon icon="article"></svg-icon>
              {{ item.categoryName }}
            </router-link>
          </div>
        </div>
        <hr color="#DCDFE6" size="1" />
        <div class="article-footer">
          <router-link
            :to="'/tag/' + tag.id"
            class="tag"
            v-for="tag in item.tags"
            :key="tag.id"
          >
            {{ tag.name }}
          </router-link>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { listArticle } from "../../api/blog";

export default {
  name: "ArticleList",

  data() {
    return {
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 文章总数
      total: 0,
      // 查询ID
      id: 0,
      // 页面标题
      title: "",
      // 文章 / 标签名称
      name: "",
      // 查询路径
      path: "",
      // 文章列表
      articleList: [],
    };
  },
  created() {
    this.path = this.$route.path;
    if (this.path.indexOf("/category") != -1) {
      this.title = "文章分类";
      this.path = "category";
    } else {
      this.title = "文章标签";
      this.path = "tag";
    }
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循获取文章列表的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "articleList") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {
    this.listArticleList();
  },

  methods: {
    listArticleList() {
      // 从当前路由中截取出文章ID
      this.id = this.$route.params.id;
      // 获取分类或标签对应文章的方法
      listArticle({
        curPage: this.curPage,
        size: this.size,
        path: this.path,
        id: this.id,
      }).then((result) => {
        let data = result.data;
        this.name = data.name;
        window.document.title = this.name;
        this.total = data.page.total;
        this.articleList = data.page.list;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.articleList-container {
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
.articleList-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.articleList-title {
  color: #fff;
  font-size: 45px;
  font-weight: 500;
}
.articleList-body {
  margin-top: 40px;
  padding: 20px 40px;
  width: 60%;
  border-radius: 10px;
  padding: 20px;
  min-height: calc(30vh);
  display: grid;
  // grid-template-rows: 1fr 1fr;
  // fr 为网格布局定义的一个新单位。它可以帮助我们摆脱计算百分比，并将可用空间按比例分配
  grid-template-columns: repeat(3, 1fr);
  // 设置列间距
  column-gap: 20px;
  // 设置行间距
  row-gap: 20px;
}
.articleList-item {
  width: 100%;
  height: 320px;
  border-radius: 8px;
  box-shadow: 0 1px 10px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
}
.article-header {
  border-radius: 8px 8px 0 0;
  overflow: hidden;
  width: 100%;
  height: 60%;
}
.on-hover {
  border-radius: 8px 8px 0 0;
  object-fit: cover;
  transition: all 0.6s;
}
.on-hover:hover {
  transform: scale(1.1);
}
.article-body {
  margin: 10px 20px 15px 20px;
}
.title {
  color: #303030;
  font-size: 14px;
}
.title:hover {
  transition: 0.8s;
  color: #409eff;
}
.info {
  width: 100%;
  margin-top: 8px;
  display: flex;
  justify-content: space-between;
}
.info-item {
  display: flex;
  align-items: center;
  color: #303030;
  font-size: 15px;
  .svg-icon {
    margin-right: 5px;
  }
}
.article-footer {
  margin-top: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.tag {
  font-size: 14px;
  font-weight: 600;
  // color: #fff;
  color: #409eff;
  padding: 3px 10px;
  margin: 0px 5px;
  border-radius: 10px;
  // background: #409eff;
  border: #409eff 1px solid;
}
.tag:hover {
  transition: 0.8s;
  color: #fff;
  background: #409eff;
}
</style>
