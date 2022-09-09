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
          <div class="article-item"></div>
          <div class="article-item"></div>
          <div class="article-item"></div>
          <div class="article-item"></div>
          <div class="article-item"></div>
          <div class="article-item"></div>
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
  cursor: pointer;
  width: 100%;
  height: 280px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  margin-bottom: 20px;
}
</style>
