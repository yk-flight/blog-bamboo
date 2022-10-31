<template>
  <div class="article-container">
    <div class="article-header" :style="cover">
      <span class="article-title">{{ article.title }}</span>
      <div class="article-description">
        <div class="article-date">
          <!-- 文章发表时间 -->
          <div class="title-item">
            <svg-icon icon="date"></svg-icon>
            <span style="margin-left: 10px">
              文章发表于&nbsp;
              {{ article.publishTime | date }}
            </span>
          </div>
          <span style="margin-left: 10px; margin-right: 10px">|</span>
          <!-- 文章更新时间 -->
          <div class="title-item">
            <svg-icon icon="time-range"></svg-icon>
            <span style="margin-left: 10px">
              更新于&nbsp;
              {{ article.uploadTime | date }}
            </span>
          </div>
          <span style="margin-left: 10px; margin-right: 10px">|</span>
          <!-- 文章分类 -->
          <div class="title-item">
            <svg-icon icon="article"></svg-icon>
            <span style="margin-left: 10px">
              {{ article.categoryName }}
            </span>
          </div>
        </div>
        <!-- 文章内容 -->
        <div class="article-content">
          <!-- 字数统计 -->
          <div class="title-item">
            <svg-icon icon="edit"></svg-icon>
            <span style="margin-left: 5px">
              字数统计&nbsp;
              {{ this.articleNum | num }}
            </span>
          </div>
          <span style="margin-left: 10px; margin-right: 10px">|</span>
          <!-- 阅读时长 -->
          <div class="title-item">
            <svg-icon icon="time"></svg-icon>
            <span style="margin-left: 5px">
              阅读时长&nbsp;
              {{ readTime }}
            </span>
          </div>
          <span style="margin-left: 10px; margin-right: 10px">|</span>
          <!-- 浏览量 -->
          <div class="title-item">
            <svg-icon icon="eye-open"></svg-icon>
            <span style="margin-left: 5px">
              阅读量&nbsp;
              {{ article.viewNum }}
            </span>
          </div>
          <span style="margin-left: 10px; margin-right: 10px">|</span>
          <!-- 评论数 -->
          <div class="title-item">
            <svg-icon icon="comments"></svg-icon>
            <span style="margin-left: 5px">
              评论数&nbsp;
              {{ article.commentNum }}
            </span>
          </div>
        </div>
      </div>
    </div>
    <!-- 文章主体 -->
    <div class="article-body">
      <div class="article-left">
        <!-- 文章内容 -->
        <article
          ref="article"
          v-html="article.contentMd"
          class="markdown-body"
        />

        <!-- 文章标签 -->
        <div class="social-container">
          <!-- 标签容器 -->
          <div class="tags-container">
            <div class="tags-item" v-for="tag in article.tags" :key="tag">
              {{ tag }}
            </div>
          </div>
          <!-- 分享容器 -->
          <share :config="config" />
        </div>

        <!-- 文章版权 -->
        <div class="article-copyright">
          <!-- 版权归属 -->
          <div class="copyright-item">
            <span class="copyright-left">版权归属：</span>
            <span class="copyright-right" target="_blank">
              {{ website.author }}
            </span>
          </div>
          <!-- 本文链接 -->
          <div class="copyright-item">
            <span class="copyright-left">本文链接：</span>
            <a :href="articleLink" class="copyright-right" target="_blank">
              {{ articleLink }}
            </a>
          </div>
          <!-- 许可协议 -->
          <div class="copyright-item">
            <span class="copyright-left">许可协议：</span>
            <span class="copyright-right">
              本文使用
              <a
                href="https://creativecommons.org/licenses/by-nc-sa/4.0/deed.zh"
                class="copyright-left"
                target="_blank"
              >
                《署名-非商业性使用-相同方式共享4.0国际(CC&nbsp;BY-NC-SA4.0)》
              </a>
              协议授权
            </span>
          </div>
        </div>

        <!-- 打赏容器 -->
        <div class="reward-container">
          <!-- 二维码 -->
          <div
            class="reward-main animate__animated animate__fadeInDown"
            v-show="isReward"
          >
            <ul class="reward-all">
              <li class="reward-item">
                <img class="reward-img" :src="websiteOther.wechatReceipt" />
                <div class="reward-desc">微信</div>
              </li>
              <li class="reward-item">
                <img class="reward-img" :src="websiteOther.alipayReceipt" />
                <div class="reward-desc">支付宝</div>
              </li>
            </ul>
          </div>
          <!-- 打赏按钮 -->
          <div class="reward-button-container" v-show="websiteOther.reward">
            <a class="reward-btn" @click="changeReward">
              <svg-icon icon="qr"></svg-icon>
              打赏
            </a>
          </div>
        </div>
        <!-- 相关推荐 -->
        <div class="recommend-container">
          <div class="recommend-header">
            <svg-icon icon="good"></svg-icon>
            <span>相关推荐</span>
          </div>
          <div class="recommend-body">
            <router-link
              :to="'/article/' + item.id"
              v-for="item in recommends"
              :key="item.id"
            >
              <div class="recommend-item">
                <img class="recommend-cover" :src="item.background" />
                <div class="recommend-desc">
                  <span style="display: flex; align-items: center">
                    <svg-icon icon="date"></svg-icon>
                    <span style="margin-left: 5px; font-size: 14px">
                      {{ item.publishTime | date }}
                    </span>
                  </span>
                  <span style="margin-top: 5px">
                    {{ item.title }}
                  </span>
                </div>
              </div>
            </router-link>
          </div>
        </div>
        <!-- 分割线 -->
        <hr />
        <!-- 评论 -->
        <comment
          :article-id="Number(this.$route.params.id)"
          v-if="article.allowComment"
        ></comment>
      </div>

      <!-- 文章目录 -->
      <div class="article-right">
        <div class="toc-container">
          <div class="title-container">
            <svg-icon icon="menu"></svg-icon>
            <span class="title-span">目录</span>
          </div>
          <!-- 目录内容 -->
          <div id="toc" class="toc" />
        </div>
      </div>
    </div>

    <toast ref="toast"></toast>
  </div>
</template>

<script>
// 生成目录
import tocbot from "tocbot";
// 代码剪切板
import Clipboard from "clipboard";
import markdownToHtml from "../../utils/markdownToHtml";
import Comment from "../comment/Comment.vue";
import { getArticleById, getRecommend } from "../../api/blog";
import Toast from "../../components/Toast/index.vue";

export default {
  name: "Article",
  created() {
    this.getArticle();
    // 获取相关推荐文章
    this.getRecommendInfo();
  },
  components: { Comment, Toast },
  data() {
    return {
      // 代码剪切粘贴
      clipboard: null,
      // 文章字数
      articleNum: 0,
      // 阅读时间
      readTime: "",
      // 文章对象
      article: {},
      // 分享的站点
      config: {
        sites: ["qzone", "qq", "weibo", "wechat", "douban"],
      },
      // 文章链接
      articleLink: window.location.href,
      // 是否显示打赏数据
      isReward: false,
      // 网站配置信息
      website: this.$store.getters.website,
      // 网站其他配置信息
      websiteOther: this.$store.getters.websiteOther,
      // 相关推荐文章
      recommends: [],
      // 图片预览
      imgList: [],
    };
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 获取当前文章的封面图片
      cover = this.article.background;
      // 返回对应的CSS
      return (
        "background: url(" +
        cover +
        ") rgba(0, 0, 0, 0.4) center center / cover no-repeat"
      );
    },
  },
  methods: {
    getArticle() {
      // 从当前路由中截取出文章ID
      let id = this.$route.params.id;
      const that = this;
      getArticleById(id).then((result) => {
        this.article = result.data;
        // 修改浏览器标题
        window.document.title = this.article.title;
        //将markdown转换为Html
        this.article.contentMd = markdownToHtml(this.article.contentMd);
        this.$nextTick(() => {
          // 统计文章字数
          this.articleNum = this.deleteHTMLTag(this.article.contentMd).length;
          // 计算阅读时间
          this.readTime = Math.round(this.articleNum / 400) + "分钟";
          // 添加代码复制功能
          this.clipboard = new Clipboard(".copy-btn");
          this.clipboard.on("success", () => {
            this.$refs.toast.binxs("代码复制成功");
          });
          let nodes = this.$refs.article.children;
          if (nodes.length) {
            for (let i = 0; i < nodes.length; i++) {
              let node = nodes[i];
              let reg = /^H[1-4]{1}$/;
              if (reg.exec(node.tagName)) {
                node.id = i;
              }
            }
          }
          // 初始化文章目录
          tocbot.init({
            tocSelector: "#toc", //要把目录添加元素位置，支持选择器
            contentSelector: ".markdown-body", //获取html的元素
            headingSelector: "h1, h2", //要显示的id的目录
            // hasInnerContainers: true,
            onClick: function (e) {
              e.preventDefault();
            },
          });
          // 防止 HTMLCollection 中有元素但 length 为 0 的情况出现
          this.$nextTick(function () {
            // 添加图片预览功能
            const imageList = this.$refs.article.getElementsByTagName("img");
            for (var i = 0; i < imageList.length; i++) {
              this.imgList.push(imageList[i].src);
              imageList[i].addEventListener("click", function (e) {
                that.previewImg(e.target.currentSrc);
              });
            }
          });
        });
      });
    },
    // 删除文章内容中的HTML标签
    deleteHTMLTag(content) {
      return content
        .replace(/<\/?[^>]*>/g, "")
        .replace(/[|]*\n/, "")
        .replace(/&npsp;/gi, "");
    },
    // 显示收款码
    changeReward() {
      this.isReward = !this.isReward;
    },
    // 获取相关推荐文章
    getRecommendInfo() {
      getRecommend().then((result) => {
        this.recommends = result.data;
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
  // 销毁组件时执行方法
  destroyed() {
    // 将代码目录与剪切粘贴板销毁
    this.clipboard.destroy();
    tocbot.destroy();
  },
};
</script>

<style lang="scss" scoped>
.article-container {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.article-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background-blend-mode: multiply;
}
.article-title {
  color: #fff;
  font-size: 35px;
  font-weight: 500;
  margin-top: 3%;
}
.article-description {
  margin-top: 10px;
  color: #fff;
  display: flex;
  align-items: center;
  flex-direction: column;
}
.article-date {
  display: flex;
  justify-content: space-between;
  align-content: center;
  font-size: 14px;
}
.title-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.article-content {
  display: flex;
  justify-content: space-between;
  align-content: center;
  font-size: 14px;
  margin-top: 5px;
}
.article-body {
  display: flex;
  justify-content: space-between;
  margin-top: 40px;
  width: 70%;
  z-index: 0;
}
.article-left {
  width: 77%;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
}
.article-right {
  width: 22%;
}
.toc-container {
  position: sticky;
  top: 20px;
  border-radius: 8px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
}
.markdown-body {
  padding: 50px 40px;
}
.title-container {
  margin-left: 20px;
  padding-top: 20px;
  display: flex;
  align-items: center;
  font-size: 18px;
}
.title-span {
  margin-left: 5px;
  font-weight: 500;
}
.article-copyright {
  margin: 0px 20px 20px 20px;
  padding: 20px;
  background: #f2f6fc;
  border: #53a8ff 1px dashed;
  border-radius: 5px;
}
.copyright-item {
  display: flex;
  font-size: 14px;
  margin-bottom: 5px;
}
.copyright-left {
  color: #409eff;
  font-weight: 800;
}
.copyright-right {
  margin-left: 10px;
  color: #909399;
}
.social-container {
  margin: 10px 20px 10px 20px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.tags-container {
  display: flex;
  align-items: center;
  font-size: 13px;
}
.tags-item {
  cursor: pointer;
  padding: 3px 10px;
  border-radius: 20px;
  margin: 3px 3px;
  color: #409eff;
  border: #53a8ff 1px solid;
}
.tags-item:hover {
  transition: 0.8s;
  color: #fff;
  background-color: #53a8ff;
  border: #53a8ff 1px solid;
}
.reward-container {
  margin-bottom: 10px;
  text-align: center;
}
.reward-button-container {
  text-align: center;
}
.reward-btn {
  padding: 8px 15px;
  margin-left: calc(50% - 25px);
  width: 50px;
  font-size: 13px;
  font-weight: 700;
  background: #49b1f5;
  color: #fff;
  display: flex;
  align-items: center;
  justify-content: center;
  .svg-icon {
    margin-right: 5px;
  }
}
.reward-btn:hover {
  transition: 0.8s;
  background: #0e5193;
  display: flex;
  align-items: center;
  justify-content: center;
}
.reward-main {
  margin-bottom: 10px;
}
.reward-all {
  display: inline-block;
  padding: 20px 10px 8px !important;
  width: 320px;
  border-radius: 4px;
  background: #e4e7ed;
}
.reward-all:before {
  position: absolute;
  bottom: -10px;
  left: 0;
  width: 100%;
  height: 20px;
  content: "";
}
.reward-all:after {
  content: "";
  position: absolute;
  right: 0;
  bottom: 2px;
  left: 0;
  margin: 0 auto;
  width: 0;
  height: 0;
  border-top: 13px solid #e4e7ed;
  border-right: 13px solid transparent;
  border-left: 13px solid transparent;
}
.reward-item {
  display: inline-block;
  padding: 0 8px;
  list-style-type: none;
}
.reward-img {
  width: 130px;
  height: 130px;
  display: block;
}
.reward-desc {
  margin-top: 5px;
  font-weight: 500;
  font-size: 13px;
  color: #606266;
  text-align: center;
}
.recommend-container {
  margin: 0px 20px 10px 20px;
  display: flex;
  justify-content: space-between;
  flex-direction: column;
}
.recommend-header {
  display: flex;
  align-items: center;
  font-size: 20px;
  font-weight: 600;
  color: #606266;
  margin-bottom: 10px;
  .svg-icon {
    margin-right: 8px;
  }
}
.recommend-body {
  width: 100%;
  display: grid;
  // grid-template-rows: 1fr 1fr;
  // fr 为网格布局定义的一个新单位。它可以帮助我们摆脱计算百分比，并将可用空间按比例分配
  grid-template-columns: repeat(3, 1fr);
  // 设置列间距
  column-gap: 10px;
  // 设置行间距
  row-gap: 10px;
}
.recommend-item {
  position: relative;
  display: inline-block;
  overflow: hidden;
  margin: 3px;
  height: 210px;
  margin: 2px;
  background: #000;
}
.recommend-cover {
  width: 100%;
  height: 100%;
  opacity: 0.4;
  transition: all 0.6s;
  object-fit: cover;
}
.recommend-item:hover .recommend-cover {
  opacity: 0.6;
  transform: scale(1.1);
}
.recommend-desc {
  position: absolute;
  height: 100%;
  width: 100%;
  color: #fff;
  top: 0;
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
}
hr {
  position: relative;
  margin: 40px 25px;
  border: 2px dashed #d2ebfd;
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
