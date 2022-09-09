<template>
  <div class="sidebar-container">
    <!-- 个人信息 -->
    <div class="blog-user">
      <div class="avatar">
        <!-- 头像 -->
        <img
          class="avatar__image"
          src="https://www.zrkizzy.com/upload/2021/11/header-90431fbd9cf848e2a5aaea0bf6b1089b.jpg"
        />
      </div>
      <!-- 博主信息 -->
      <div class="blog-name">世纪末的架构师</div>
      <!-- 博客座右铭 -->
      <div class="blog-title">疯狂的热爱夹带着文雅</div>
      <!-- 文章信息 -->
      <div class="blog-info">
        <!-- 文章 -->
        <div class="info-item">
          <div class="item-title">文章</div>
          <div class="item-data">10</div>
        </div>
        <!-- 分类 -->
        <div class="info-item">
          <div class="item-title">分类</div>
          <div class="item-data">9</div>
        </div>
        <!-- 标签 -->
        <div class="info-item">
          <div class="item-title">标签</div>
          <div class="item-data">6</div>
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
        <a href="https://github.com/Architect-Java" target="_blank">
          <svg-icon icon="github" class="link-icon"></svg-icon>
        </a>
        <!-- Gitee -->
        <a href="https://gitee.com/dream-flight" target="_blank">
          <svg-icon icon="gitee" class="link-icon"></svg-icon>
        </a>
        <!-- CSDN -->
        <a
          href="https://blog.csdn.net/qq_48455576?spm=1000.2115.3001.5343"
          target="_blank"
        >
          <svg-icon icon="csdn" class="link-icon"></svg-icon>
        </a>
        <!-- leetcode -->
        <a href="https://leetcode.cn/u/dream-flight/" target="_blank">
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
          <span>本站总字数：</span>
          <span>29.8k 字</span>
        </div>
        <div class="body-item">
          <span>运行时间：</span>
          <span>982 天</span>
        </div>
        <div class="body-item">
          <span>总访问量：</span>
          <span>40274 次</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "SideBar",

  data() {
    return {};
  },

  mounted() {},

  methods: {
    // 收藏本站
    collect() {},
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
  height: 160px;
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
</style>
