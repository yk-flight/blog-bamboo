<template>
  <div class="links-container">
    <div class="links-header" :style="cover">
      <span class="links-title">友情链接</span>
    </div>
    <div class="links-body">
      <!-- 友链展示 -->
      <div>
        <div class="friend-title">
          <svg-icon icon="links"></svg-icon>
          大佬链接
        </div>

        <!-- 链接容器 -->
        <div class="friend-container">
          <!-- 链接项 -->
          <a
            :href="item.website"
            target="_blank"
            class="friend-item animate__animated animate__jello"
            v-for="item in linkList"
            :key="item.id"
          >
            <div class="avatar">
              <img class="avatar__image" :src="item.logo" />
            </div>
            <div>
              <div class="blog-title">{{ item.title }}</div>
              <div class="blog-description">{{ item.description }}</div>
            </div>
          </a>
        </div>
      </div>
      <!-- 交换友链和添加友链 -->
      <div class="friend-body">
        <div class="friend-title">
          <svg-icon icon="guide"></svg-icon>
          添加友链
        </div>
        <!-- 当前博客友链信息 -->
        <div class="friend-info">
          <!-- 友链信息 -->
          <div class="link-info">
            <!-- 名称 -->
            <div class="info-item">
              <span class="info-left">名称：</span>
              <span class="info-right"> {{ website.name }} </span>
            </div>
            <!-- 简介 -->
            <div class="info-item">
              <span class="info-left">简介：</span>
              <span class="info-right"> {{ website.introduction }} </span>
            </div>
            <!-- 头像 -->
            <div class="info-item">
              <span class="info-left">头像：</span>
              <span class="info-right">
                {{ website.logo }}
              </span>
            </div>
          </div>
        </div>
        <!-- 交换友链提示 -->
        <div style="margin: 20px">
          <span class="info-right" style="color: #606266">
            有需要交换友链的小伙伴可以在下方留言
          </span>
        </div>
        <!-- 友链需要 -->
        <div class="friend-info">
          <!-- 当前博客友链信息 -->
          <div class="link-info">
            <!-- 名称 -->
            <div class="info-item">
              <span class="info-left">提示：</span>
              <span class="info-right">
                你的友链信息需要包含：网站名称、网站介绍、网站链接、网站头像
              </span>
            </div>
          </div>
        </div>
      </div>
      <!-- 评论留言 -->
      <comment :article-id="0"></comment>
    </div>
  </div>
</template>

<script>
import Comment from "../comment/Comment.vue";
import { getLinkList } from "../../api/blog";

export default {
  name: "Links",
  components: { Comment },
  data() {
    return {
      // 友链列表
      linkList: [],
      // 网站配置信息
      website: this.$store.getters.website,
    };
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取友链页面的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "links") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {
    this.getLinksInfo();
  },

  methods: {
    getLinksInfo() {
      getLinkList().then((result) => {
        this.linkList = result.data;
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.links-container {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.links-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.links-title {
  color: #fff;
  font-size: 50px;
  font-weight: 500;
}
.links-body {
  margin-top: 40px;
  width: 70%;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
  padding: 20px;
  min-height: calc(30vh);
}
.friend-title {
  display: flex;
  align-items: center;
  font-size: 20px;
  font-weight: 600;
  color: #606266;
  margin-bottom: 20px;
  margin-top: 30px;
  margin-left: 20px;
  .svg-icon {
    margin-right: 8px;
    color: #409eff;
  }
}
.friend-body {
  margin-top: 20px;
  margin-bottom: 30px;
}
.friend-info {
  margin: 20px;
}
.link-info {
  margin: 0px 20px 20px 20px;
  padding: 20px;
  background: #f2f6fc;
  border: #53a8ff 1px dashed;
  border-radius: 5px;
}
.info-item {
  display: flex;
  font-size: 14px;
  margin-bottom: 5px;
}
.info-left {
  color: #409eff;
  font-weight: 800;
}
.info-right {
  margin-left: 10px;
  color: #909399;
}
.friend-container {
  margin-left: 20px;
  margin-right: 20px;
  padding: 30px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  display: grid;
  // fr 为网格布局定义的一个新单位。它可以帮助我们摆脱计算百分比，并将可用空间按比例分配
  grid-template-columns: repeat(3, 1fr);
  // 设置列间距
  column-gap: 30px;
  // 设置行间距
  row-gap: 30px;
}
.friend-item {
  width: 100%;
  height: 120px;
  border-radius: 10px;
  text-decoration: none;
  background: linear-gradient(#409eff 0 100%) left/0 no-repeat;
  display: flex;
  align-items: center;
}
.friend-item:hover {
  transition: 0.5s;
  background-size: 100%;
  .avatar {
    transform: rotate(360deg);
  }
  .blog-title {
    color: #fff;
  }
  .blog-description {
    color: #fff;
  }
}
.avatar {
  /* Rounded border */
  height: 80px;
  width: 80px;
  transition: all 0.5s;
  margin: 0px 20px;
}
.avatar__image {
  /* Rounded border */
  border-radius: 50%;
  height: 100%;
  width: 100%;
}
.blog-title {
  color: #000;
  font-size: 22px;
  font-weight: bold;
  margin-bottom: 10px;
}
.blog-description {
  color: #606266;
  font-size: 14px;
}
</style>
