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
        <!-- 个人座右铭 -->
        <div class="home-item">
          <div class="item-header">座右铭</div>
          <span class="item-content">
            困难只能吓倒懦夫、懒汉，而胜利永远属于攀登高峰的人。人生的奋斗目标不要太大，认准了一件事情，投入兴趣与热情坚持去做，你就会成功。人生，要的就是惊涛骇浪，这波涛中的每一朵浪花都是伟大的，最后汇成闪着金光的海洋。
          </span>
        </div>
        <!-- 公告 -->
        <div class="home-item" style="height: 230px">
          <div class="item-header">
            <svg-icon icon="announcement_flat"></svg-icon>
            公告
          </div>
          <img src="https://ghchart.rshah.org/Architect-Java" width="750px" />
        </div>

        <!-- 博客内容 -->
        <div class="main-body">
          <!-- 具体文章 -->
          <div class="article-item">
            <!-- :class="isRight(index)" -->
            <div class="item-img-left">
              <router-link to="/">
                <img
                  src="https://pic1.zhimg.com/80/v2-e012e11ff2cd3270df046e3cd4fb9fbe_1440w.jpg"
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
                <router-link to="/"> 前路有光，初心莫忘 </router-link>
              </div>
              <div class="blog-body">
                <!-- 置顶 -->
                <div class="blog-top">
                  <svg-icon icon="on-top"></svg-icon>
                  <span>置顶</span>
                </div>
                <span>｜</span>
                <!-- 日期 -->
                <div class="blog-item">
                  <svg-icon icon="date"></svg-icon>
                  <span class="item-title">2022-01-29</span>
                </div>
                <span>｜</span>
                <!-- 分类 -->
                <div class="blog-item">
                  <svg-icon icon="article"></svg-icon>
                  <router-link to="/">生活随笔</router-link>
                </div>
                <span>｜</span>
                <!-- 标签 -->
                <div class="blog-item">
                  <svg-icon icon="tags"></svg-icon>
                  <router-link to="/">SpringBoot</router-link>
                </div>
              </div>
              <!-- 摘要 -->
              <div class="blog-summary">
                <span>
                  2021年的旅程也落下了帷幕，2021年让我有点依依不舍，在2021年里曾流过辛勤的汗水、也流过激动的泪水，正因为经历了这点点滴
                  滴的酸与甜，才让我不断成长着，进步着。这一年里我做了不少工作，从一个一无所知的小白到现在初出茅庐的菜鸟，在内心中自己跨出
                  了面向社会的第一步
                </span>
              </div>
            </div>
          </div>

          <div class="article-item">
            <!-- 文章内容 -->
            <div class="blog-content">
              <!-- 文章标题 -->
              <div class="blog-title">
                <router-link to="/"> 前路有光，初心莫忘 </router-link>
              </div>
              <div class="blog-body">
                <!-- 日期 -->
                <div class="blog-item">
                  <svg-icon icon="date"></svg-icon>
                  <span class="item-title">2022-01-29</span>
                </div>
                <span>｜</span>
                <!-- 分类 -->
                <div class="blog-item">
                  <svg-icon icon="article"></svg-icon>
                  <router-link to="/">生活随笔</router-link>
                </div>
                <span>｜</span>
                <!-- 标签 -->
                <div class="blog-item">
                  <svg-icon icon="tags"></svg-icon>
                  <router-link to="/">SpringBoot</router-link>
                </div>
              </div>
              <!-- 摘要 -->
              <div class="blog-summary">
                <span>
                  2021年的旅程也落下了帷幕，2021年让我有点依依不舍，在2021年里曾流过辛勤的汗水、也流过激动的泪水，正因为经历了这点点滴
                  滴的酸与甜，才让我不断成长着，进步着。这一年里我做了不少工作，从一个一无所知的小白到现在初出茅庐的菜鸟，在内心中自己跨出
                  了面向社会的第一步
                </span>
              </div>
            </div>
            <div class="item-img-right">
              <a href="">
                <img
                  src="https://pic1.zhimg.com/80/v2-e012e11ff2cd3270df046e3cd4fb9fbe_1440w.jpg"
                  height="100%"
                  width="100%"
                  class="on-hover"
                />
              </a>
            </div>
          </div>
          <div class="article-item"></div>
          <div class="article-item"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Banner from "@/components/Banner/index.vue";
import SideBar from "@/layout/SideBar/index.vue";

export default {
  name: "Home",
  components: { Banner, SideBar },
  computed: {
    isRight() {
      return function (index) {
        if (index % 2 == 0) {
          return "item-img-left";
        }
        return "item-img-right";
      };
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
  margin-bottom: 20px;
  align-items: center;
  flex-direction: column;
  width: 100%;
  height: 180px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-image: url("../../assets/images/background-item.png");
}
.item-header {
  font-size: 18px;
  margin-top: 20px;
  margin-bottom: 20px;

  .svg-icon {
    font-size: 25px;
    margin-right: 5px;
  }
}
.item-content {
  width: 80%;
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
  width: 45%;
  height: 100%;
  overflow: hidden;
  border-radius: 10px 0 0 10px;
}
.item-img-right {
  width: 45%;
  right: 0;
  height: 100%;
  overflow: hidden;
  border-radius: 0 10px 10px 0;
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
  color: rgba(66, 185, 133);
}
.blog-body {
  width: 85%;
  margin-top: 10px;
  margin-bottom: 10px;
  display: flex;
  justify-content: space-between;
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
  letter-spacing: 2px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}
</style>
