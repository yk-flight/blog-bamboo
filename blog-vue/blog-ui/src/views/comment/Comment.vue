<template>
  <div class="comment-container">
    <div class="comment-header">
      <svg-icon icon="message"></svg-icon>
      <span style="margin-left: 10px"> 评论 </span>
    </div>
    <!-- 评论框体 -->
    <div class="comment-body">
      <!-- 输入框头部 -->
      <div class="comment-input">
        <div class="avatar">
          <img class="avatar__image" :src="websiteOther.avatar" />
        </div>
        <!-- Input -->
        <div class="authorization">
          <input
            type="text"
            class="input-warpper"
            placeholder="输入一个自己喜欢的昵称吧"
            v-model="nickName"
          />
        </div>
      </div>
      <!-- 评论内容输入 -->
      <div class="comment-textarea">
        <textarea
          id="comment"
          class="textarea-warpper"
          placeholder="你是我一生只会遇到一次的惊喜！"
          v-model="commentContent"
        ></textarea>
        <div class="action-container">
          <div class="emoji">
            <span class="emoji-icon" @click="emojiShow = !emojiShow">
              <svg-icon icon="emoji"></svg-icon>
            </span>
            <button class="action-button" @click="addComment">提交</button>
          </div>
          <!-- 表情框 -->
          <emoji @addEmoji="addEmoji" :chooseEmoji="emojiShow" />
        </div>
      </div>
    </div>
    <!-- 评论底部 -->
    <div class="comment-footer">
      <div class="footer-title">评论数量：{{ total }} 条</div>
      <div class="footer-body">
        <!-- 父评论 -->
        <div
          class="parent-item"
          v-for="(item, index) of commentList"
          :key="item.id"
        >
          <!-- 评论头部 -->
          <div class="item-header">
            <!-- 评论头像 -->
            <div class="avatar" style="width: 40px; height: 40px">
              <img
                class="avatar__image"
                :src="website.logo"
                v-if="item.identity == 0"
              />
              <img v-else class="avatar__image" :src="websiteOther.avatar" />
            </div>
            <!-- 评论人信息 -->
            <div style="margin-left: 20px">
              <div class="comment-name">
                {{ item.nickName }}
                <span class="blog-author" v-if="item.identity == 0">博主</span>
              </div>
              <div class="comment-other">
                {{ item.ipSource }}
                &nbsp;&nbsp;
                {{ item.commentTime | date }}
              </div>
            </div>
          </div>
          <!-- 评论内容 -->
          <div class="comment-content" v-html="item.content"></div>
          <!-- 评论回复按钮 -->
          <div class="reply">
            <button class="action-button" @click="replyComment(index, item)">
              回复
            </button>
          </div>
          <!-- 回复框 -->
          <!-- <reply ref="reply"></reply> -->
          <!-- 子评论 -->
          <div
            class="child-item"
            v-for="child in item.children"
            :key="child.id"
          >
            <!-- 评论头部 -->
            <div class="item-header">
              <!-- 评论头像 -->
              <div class="avatar" style="width: 40px; height: 40px">
                <img
                  class="avatar__image"
                  :src="website.logo"
                  v-if="child.identity == 0"
                />
                <img v-else class="avatar__image" :src="websiteOther.avatar" />
              </div>
              <!-- 评论人信息 -->
              <div style="margin-left: 20px">
                <div class="comment-name">
                  {{ child.nickName }}
                  <span class="blog-author" v-if="child.identity == 0">
                    博主
                  </span>
                </div>
                <div class="comment-other">
                  {{ child.ipSource }}
                  &nbsp;&nbsp;
                  {{ child.commentTime | date }}
                </div>
              </div>
            </div>
            <!-- 评论信息 -->
            <div class="comment-content">
              <a style="color: #409eff"> @ {{ child.replyName }} </a>
              <span style="margin-left: 5px" v-html="child.content"></span>
            </div>
            <!-- 评论回复按钮 -->
            <div class="reply">
              <button class="action-button" @click="reloadReply(index, child)">
                回复
              </button>
            </div>
          </div>
          <reply ref="reply"></reply>
        </div>
      </div>
      <div class="main-footer">
        <span class="more" @click="handleClick" v-if="total > curTotal">
          点击加载更多...
        </span>
      </div>
    </div>
    <!-- 消息提示框 -->
    <toast ref="toast"></toast>
  </div>
</template>

<script>
import Toast from "../../components/Toast/index.vue";
import { listComment, saveComment } from "../../api/blog";
import Emoji from "../../components/Emoji/index.vue";
import Reply from "../reply/Reply.vue";
import EmojiList from "../../assets/js/emoji";

export default {
  name: "Comment",
  components: { Emoji, Toast, Reply },
  props: {
    // 当前文章ID
    articleId: {
      type: Number,
    },
  },
  data() {
    return {
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 数据总数
      total: 0,
      // 当前显示的评论总数
      curTotal: 0,
      // 评论数据
      commentList: [],
      // 是否显示表情包选择框
      emojiShow: false,
      // 用户昵称
      nickName: "",
      // 评论内容
      commentContent: "",
      // 用户身份
      identity: 1,
      // 评论父ID
      parentId: 0,
      // 回复人
      replyName: "",
      // 网站配置信息
      website: this.$store.getters.website,
      // 网站其他信息
      websiteOther: this.$store.getters.websiteOther,
      // 是否显示回复框
      childReplyhow: false,
    };
  },

  mounted() {
    this.getCommentList();
  },

  methods: {
    // 获取评论数据
    getCommentList() {
      listComment({
        curPage: this.curPage,
        size: this.size,
        id: this.articleId,
      }).then((result) => {
        let data = result.data;
        this.total = data.total;
        this.commentList = data.list;
        this.commentList.forEach((item) => {
          this.curTotal += item.children.length;
        });
        this.curTotal += this.commentList.length;
      });
    },
    // 获取更多文章
    handleClick() {
      this.size += 10;
      this.getCommentList();
    },
    // 添加表情包方法
    addEmoji(key) {
      this.commentContent += key;
    },
    // 提交评论
    addComment() {
      // 非空判断
      if (this.nickName.trim() == "") {
        this.$refs.toast.error("请输入昵称");
        return;
      }
      if (this.commentContent.trim() == "") {
        this.$refs.toast.error("请输入评论内容");
        return;
      }
      // 根据评论内容解析表情数据
      var reg = /\[.+?\]/g;
      this.commentContent = this.commentContent.replace(reg, function (str) {
        return (
          "<img src= '" +
          EmojiList[str] +
          "' width='24'height='24' style='margin: 0 1px;'/>"
        );
      });
      // 提交评论信息
      saveComment({
        nickName: this.nickName,
        content: this.commentContent,
        parentId: this.parentId,
        articleId: this.articleId,
        identity: this.identity,
        replyName: this.replyName,
      }).then((result) => {
        let data = result.data;
        if (data.code == 200) {
          this.$refs.toast.binxs(data.message);
        } else {
          this.$refs.toast.error(data.message);
        }
        // 重新设置用户的评论信息
        this.reset();
        // 重新加载评论
        this.getCommentList();
      });
    },
    // 重新设置用户评论信息
    reset() {
      this.commentContent = "";
      this.identity = 1;
      this.parentId = 0;
    },
    // 回复评论
    replyComment(index, item) {
      this.hideReply();
      //传值给回复框
      this.$refs.reply[index].commentContent = "";
      this.$refs.reply[index].replyName = item.nickName;
      this.$refs.reply[index].articleId = item.articleId;
      this.$refs.reply[index].parentId = item.id;
      this.$refs.reply[index].$el.style.display = "block";
    },
    // 重新加载回复框
    reloadReply(index, child) {
      this.hideReply();
      //传值给回复框
      this.$refs.reply[index].commentContent = "";
      this.$refs.reply[index].replyName = child.nickName;
      this.$refs.reply[index].articleId = child.articleId;
      this.$refs.reply[index].parentId = child.parentId;
      this.$refs.reply[index].$el.style.display = "block";
    },
    // 隐藏所有父回复框与子回复框
    hideReply() {
      // 将所有的父回复框和子回复框进行隐藏
      this.$refs.reply.forEach((item) => {
        item.$el.style.display = "none";
      });
      if (this.$refs.childReply) {
        this.$refs.childReply.forEach((item) => {
          item.$el.style.display = "none";
        });
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.comment-container {
  margin: 20px;
}
.comment-header {
  display: flex;
  align-items: center;
  font-size: 20px;
  color: #606266;
  font-weight: 600;
}
.footer-title {
  font-size: 16px;
  color: #606266;
  font-weight: 600;
  margin-left: 10px;
}
.comment-body {
  width: 100%;
  margin: 20px 0px;
}
.avatar {
  /* Rounded border */
  border-radius: 50%;
  height: 40px;
  width: 40px;
  transition: all 0.5s;
}
.avatar__image {
  /* Rounded border */
  border-radius: 50%;
  height: 100%;
  width: 100%;
}
.avatar:hover {
  transform: rotate(360deg);
}
.comment-input {
  width: 100%;
  display: flex;
  align-items: center;
}
.input-warpper {
  border: 1px #e4e7ed solid;
  margin: 3px 0px 3px 10px;
  padding-left: 10px;
  height: 35px;
  border-radius: 5px;
}
.input-warpper:focus {
  transition: 0.5s;
  outline: none;
  border: 1px #409eff solid;
}
.comment-textarea {
  margin: 12px 0px;
  border-radius: 5px;
  text-align: center;
  border: #e4e7ed 1px solid;
}
.textarea-warpper {
  padding: 10px 15px;
  border: none;
  resize: none;
  outline: none;
  width: calc(100% - 30px);
  height: 120px;
  border-radius: 5px;
}
.action-container {
  margin: 10px 0;
}
.emoji {
  width: 100%;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.emoji-icon {
  cursor: pointer;
  width: 10%;
  font-size: 30px;
  color: #606266;
}
.action-button {
  margin-right: 30px;
  border: none;
  background: #409eff;
  color: #fff;
  border-radius: 5px;
  padding: 5px 18px;
  font-weight: 600;
}
.action-button:hover {
  transition: 0.5s;
  background: #0e5193;
}
.authorization {
  width: calc(100% - 40px);
  display: flex;
  justify-content: center;
  flex-direction: column;
}
.comment-footer {
  width: 100%;
  margin: 20px 0px;
}
.footer-body {
  margin-top: 20px;
  margin-left: 10px;
  width: 100%;
}
.parent-item {
  margin-bottom: 20px;
  display: flex;
  flex-direction: column;
}
.item-header {
  display: flex;
  align-items: center;
}
.comment-name {
  font-size: 15px;
  font-weight: 600;
  margin-bottom: 5px;
  display: flex;
  align-items: center;
}
.comment-other {
  color: #909399;
  font-weight: 500;
  font-size: 13px;
}
.comment-content {
  margin: 30px 100px 0px 60px;
  font-size: 14px;
  color: #606266;
  display: flex;
  align-items: center;
}
.reply {
  margin-right: 10px;
  margin-bottom: 20px;
  text-align: right;
}
.child-item {
  margin-left: 50px;
}
.blog-author {
  background: #409eff;
  color: #fff;
  font-size: 12px;
  padding: 3px 8px;
  margin-left: 10px;
  border-radius: 5px;
}
.main-footer {
  margin: 30px 0px 50px 0px;
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
