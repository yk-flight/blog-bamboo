<template>
  <div class="home-container">
    <!--  博客Bnner  -->
    <Banner></Banner>
    <div class="home-body">
      <div class="body-left">
        <!-- 侧边栏 -->
        <SideBar></SideBar>
      </div>
      <div class="body-right">
        <!-- 公告 -->
        <div class="home-item">
          <div class="item-header">
            <svg-icon icon="announcement_flat"></svg-icon>
            <span>公告</span>
          </div>
          <span class="item-content">
            {{ website.publish }}
          </span>
        </div>

        <!-- 个人座右铭 -->
        <div class="home-item">
          <div class="item-header">座右铭</div>
          <span class="item-content">
            {{ website.motto }}
          </span>
        </div>

        <!-- 博客内容 -->
        <div class="main-body">
          <!-- 具体文章 -->
          <div
            class="article-item"
            v-for="(item, index) of articleList"
            :key="item.id"
          >
            <div :class="isRight(index)">
              <router-link :to="'/article/' + item.id">
                <img
                  :src="item.background"
                  height="100%"
                  width="100%"
                  class="on-hover"
                />
              </router-link>
            </div>
            <!-- 文章内容 -->
            <div class="blog-content">
              <!-- 文章标题 -->
              <div class="blog-title">
                <router-link :to="'/article/' + item.id">
                  {{ item.title }}
                </router-link>
              </div>
              <div class="blog-body">
                <!-- 置顶 -->
                <div class="blog-top" v-if="item.top">
                  <svg-icon icon="on-top"></svg-icon>
                  <span>置顶</span>
                  <span style="margin: 0px 10px; color: #000">|</span>
                </div>

                <!-- 日期 -->
                <div class="blog-item">
                  <svg-icon icon="date"></svg-icon>
                  <span class="item-title">
                    {{ item.publishTime | date }}
                  </span>
                </div>
                <span style="margin: 0px 10px">|</span>
                <!-- 分类 -->
                <div class="blog-item">
                  <svg-icon icon="article"></svg-icon>
                  <router-link :to="'/category/' + item.category">
                    {{ item.categoryName }}
                  </router-link>
                </div>
                <span style="margin-left: 10px">|</span>
                <!-- 标签 -->
                <div
                  class="blog-item"
                  style="margin-left: 10px"
                  v-for="tag in item.tags"
                  :key="tag.id"
                >
                  <svg-icon icon="tags"></svg-icon>
                  <router-link :to="'/tag/' + tag.id">
                    {{ tag.name }}
                  </router-link>
                </div>
              </div>
              <!-- 摘要 -->
              <div class="blog-summary">
                <span>
                  {{ item.summary }}
                </span>
              </div>
            </div>
          </div>
        </div>

        <div class="main-footer">
          <span
            class="more"
            @click="handleClick"
            v-if="total > articleList.length"
          >
            点击加载更多...
          </span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Banner from "@/components/Banner/index.vue";
import SideBar from "@/layout/SideBar/index.vue";
import { getArticleList } from "../../api/blog";

export default {
  name: "Home",
  components: { Banner, SideBar },
  data() {
    return {
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 数据总数
      total: 0,
      // 文章列表
      articleList: [],
      // 网站配置信息
      website: this.$store.getters.website,
    };
  },
  computed: {
    isRight() {
      return function (index) {
        if (index % 2 == 0) {
          return "item-img-left left-radius";
        }
        return "item-img-right right-radius";
      };
    },
  },
  mounted() {
    // 修改浏览器标题
    window.document.title = this.website.name;
    this.getArticlesInfo();
  },
  methods: {
    // 获取文章列表
    getArticlesInfo() {
      getArticleList({
        curPage: this.curPage,
        size: this.size,
      }).then((result) => {
        let data = result.data;
        // 定义当前返回的文章集合
        this.articleList = data.list;
        // 数据总条数
        this.total = data.total;
      });
    },
    // 获取更多文章
    handleClick() {
      this.size += 10;
      this.getArticlesInfo();
    },
  },
};
</script>

<style lang="scss" scoped>
.home-container {
  height: auto;
  width: 100%;
}
.home-body {
  margin: 20px auto 20px auto;
  // height: 100%;
  width: 70%;
  display: flex;
  justify-content: space-between;
}
.body-left {
  width: 285px;
  margin-right: 20px;
  top: 0;
}
.body-right {
  height: 100%;
  width: 80%;
  // margin: auto;
  display: flex;
  flex-direction: column;
}
.home-item {
  display: flex;
  padding-bottom: 55px;
  margin-bottom: 20px;
  align-items: center;
  flex-direction: column;
  width: 100%;
  // height: 180px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-image: url("../../assets/images/background-item.png");
}
.item-header {
  font-size: 18px;
  margin-top: 30px;
  margin-bottom: 20px;
  display: flex;
  align-items: center;
  font-weight: 600;

  .svg-icon {
    font-size: 25px;
    margin-right: 5px;
  }
}
.item-content {
  padding: 0px 100px;
  font-weight: 500;
  color: #34495e;
}
.main-body {
  display: flex;
  align-items: center;
  flex-direction: column;
  width: 100%;
  height: auto;
}
.article-item {
  width: 100%;
  height: 300px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  margin-bottom: 20px;
  display: flex;
  justify-content: space-between;
}
.item-img-left {
  width: 50%;
  height: 100%;
  overflow: hidden;
}
.left-radius {
  border-radius: 10px 0 0 10px;
  order: 0;
}
.item-img-right {
  width: 50%;
  right: 0;
  height: 100%;
  overflow: hidden;
}
.right-radius {
  border-radius: 0 10px 10px 0;
  order: 1;
}
.on-hover {
  object-fit: cover;
  transition: all 0.6s;
}
.article-item a:hover .on-hover {
  transform: scale(1.1);
}
.blog-content {
  width: 55%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  height: 70%;
  // padding-top: 3%;
  margin: 30px;
}
.blog-title {
  font-weight: 700;
  font-size: 23px;
  a {
    text-decoration: none;
    color: #273849;
  }
}
.blog-title a {
  transition: all 0.5s;
}
.blog-title a:hover {
  color: #409eff;
}
.blog-body {
  width: 100%;
  margin-top: 10px;
  margin-bottom: 10px;
  display: flex;
  font-size: 14px;
  .svg-icon {
    margin-right: 5px;
  }
}
.blog-top {
  color: red;
  display: flex;
  justify-content: center;
  align-items: center;
}
.blog-item {
  display: flex;
  justify-content: center;
  align-items: center;
  .svg-icon {
    color: rgb(81, 83, 87);
  }
  .item-title {
    color: rgb(131, 132, 135);
  }
}
.blog-body a {
  color: rgb(131, 132, 135);
  text-decoration: none;
}
.blog-summary {
  height: 40%;
  font-size: 14px;
  line-height: 2;
  color: rgba(0, 0, 0, 0.66);
  letter-spacing: 1px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}
.main-footer {
  margin: 30px 0px;
  text-align: center;
}
.more {
  cursor: pointer;
  color: #fff;
  background: #409eff;
  padding: 10px 25px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 600;
}
.more:hover {
  transition: 0.8s;
  background: #0e5193;
}
</style>
