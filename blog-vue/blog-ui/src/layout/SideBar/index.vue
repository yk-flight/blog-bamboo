<template>
  <div class="sidebar-container">
    <!-- 个人信息 -->
    <div class="blog-user">
      <div class="avatar">
        <!-- 头像 -->
        <img class="avatar__image" :src="website.logo" />
      </div>
      <!-- 博主信息 -->
      <div class="blog-name">{{ website.author }}</div>
      <!-- 博客座右铭 -->
      <div class="blog-title">{{ website.introduction }}</div>
      <!-- 文章信息 -->
      <div class="blog-info">
        <!-- 文章 -->
        <div class="info-item">
          <div class="item-title">文章</div>
          <div class="item-data">{{ website.articleCount }}</div>
        </div>
        <!-- 分类 -->
        <div class="info-item">
          <div class="item-title">分类</div>
          <div class="item-data">{{ website.categoryCount }}</div>
        </div>
        <!-- 标签 -->
        <div class="info-item">
          <div class="item-title">标签</div>
          <div class="item-data">{{ website.tagsCount }}</div>
        </div>
      </div>
      <!-- 收藏本站 -->
      <div class="blog-collect" @click="collect">
        <svg-icon icon="star"></svg-icon>
        收藏本站
      </div>
      <!-- 链接 -->
      <div class="blog-link">
        <!-- Github -->
        <a :href="social.github" target="_blank" v-if="social.githubShow">
          <svg-icon icon="github" class="link-icon"></svg-icon>
        </a>
        <!-- Gitee -->
        <a :href="social.gitee" target="_blank" v-if="social.giteeShow">
          <svg-icon icon="gitee" class="link-icon"></svg-icon>
        </a>
        <!-- CSDN -->
        <a :href="social.csdn" target="_blank" v-if="social.csdnShow">
          <svg-icon icon="csdn" class="link-icon"></svg-icon>
        </a>
        <!-- leetcode -->
        <a :href="social.leetcode" target="_blank" v-if="social.leetcodeShow">
          <svg-icon icon="leetcode" class="link-icon"></svg-icon>
        </a>
      </div>
    </div>
    <!-- 网站咨询 -->
    <div class="blog-web">
      <div class="web-title">
        <svg-icon icon="access"></svg-icon>
        站点信息
      </div>
      <div class="web-body">
        <div class="body-item">
          <span>运行时间：</span>
          <span>{{ time }} 天</span>
        </div>
        <div class="body-item">
          <span>总访问量：</span>
          <span>{{ website.visitCount }} 次</span>
        </div>
      </div>
    </div>

    <toast ref="toast"></toast>
  </div>
</template>

<script>
import dayjs from "dayjs";
import Toast from "../../components/Toast/index.vue";

export default {
  name: "SideBar",
  components: { Toast },
  data() {
    return {
      // 网站社交信息
      social: this.$store.getters.social,
      // 网站配置信息
      website: this.$store.getters.website,
      // 网站运行时间
      time: "",
    };
  },

  mounted() {
    this.runtime();
  },
  methods: {
    // 收藏本站
    collect() {
      this.$refs.toast.binxs("按Ctrl + D即可收藏本站");
    },
    // 计算网站运行时间
    runtime() {
      // 将网站创建时间转为时间戳
      var date = dayjs().format("YYYY-MM-DD");
      var startDate = dayjs(this.$store.getters.website.createDate).format(
        "YYYY-MM-DD"
      );
      this.time = dayjs(date).diff(startDate, "day");
    },
  },
};
</script>

<style lang="scss" scoped>
.sidebar-container {
  position: sticky;
  top: 10px;
  width: 100%;
  display: flex;
  align-items: center;
  flex-direction: column;
}
.blog-user {
  width: 100%;
  height: 380px;
  background-color: #fff;
  display: flex;
  align-items: center;
  // 纵轴对齐
  flex-direction: column;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  border-radius: 10px;
}
.avatar {
  margin-top: 30px;
  margin-bottom: 20px;
  /* Rounded border */
  border-radius: 50%;
  height: 80px;
  width: 80px;
  transition: all 0.5s;
}
.avatar__image {
  /* Rounded border */
  border-radius: 5%;
  height: 100%;
  width: 100%;
}
.avatar:hover {
  transform: rotate(360deg);
}
.blog-name {
  width: 100%;
  margin-bottom: 10px;
  text-align: center;
  font-size: 16px;
  font-weight: 500;
}
.blog-title {
  font-size: 14px;
  color: rgba(145, 141, 141, 0.884);
}
.blog-info {
  text-align: center;
  margin-top: 15px;
  display: flex;
}
.info-item {
  text-align: center;
  width: 80px;
  height: 70px;
}
.item-title {
  font-size: 15px;
  margin-bottom: 10px;
  color: #606266;
}
.item-data {
  font-size: 18px;
  margin-top: 5px;
  margin-bottom: 10px;
  font-weight: 400;
  color: rgb(34, 34, 34);
}
.blog-collect {
  height: 35px;
  width: 80%;
  margin-left: 20px;
  margin-right: 20px;
  text-align: center;
  background-color: #409eff;
  color: #fff;
  line-height: 35px;
  font-size: 14px;
  cursor: pointer;
  transition-duration: 1s;
  transition-property: color;
}
.blog-collect:hover {
  transition: all 0.3s ease-in-out;
  background-color: #ff7242;
}
.blog-collect .svg-icon {
  font-size: 12px;
  margin-right: 3px;
}
.blog-link {
  margin-top: 20px;
  display: flex;
  justify-content: space-between;
  align-content: center;
}
.link-icon {
  font-size: 24px;
  margin: 0 13px;
}
.blog-web {
  margin-top: 20px;
  width: 100%;
  height: 130px;
  background-color: #fff;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  border-radius: 10px;
}
.web-title {
  padding-top: 20px;
  padding-left: 30px;
  font-size: 18px;
  .svg-icon {
    font-size: 16px;
    margin-right: 5px;
  }
}
.web-body {
  margin-top: 10px;
  margin-left: 30px;
  margin-right: 30px;
  display: flex;
  // 纵轴对齐
  flex-direction: column;
}
.body-item {
  margin: 3px 0;
  font-size: 14px;
  color: #606266;
  display: flex;
  justify-content: space-between;
}
a {
  color: #000;
}
</style>
