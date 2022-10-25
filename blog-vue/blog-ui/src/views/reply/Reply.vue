<template>
  <!-- 评论框体 -->
  <div style="width: 90%; margin: 5px 0px 30px 60px; display: none" ref="reply">
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
        :placeholder="'回复 @' + replyName + '：'"
        v-model="commentContent"
      ></textarea>
      <div class="action-container">
        <div class="emoji">
          <span class="emoji-icon" @click="emojiShow = !emojiShow">
            <svg-icon icon="emoji"></svg-icon>
          </span>
          <!--  -->
          <div>
            <button class="cancel-button" @click="cancleReply">取消</button>
            <button class="action-button" @click="addComment">提交</button>
          </div>
        </div>
        <!-- 表情框 -->
        <emoji @addEmoji="addEmoji" :chooseEmoji="emojiShow" />
      </div>
    </div>
    <toast ref="toast"></toast>
  </div>
</template>

<script>
import Toast from "../../components/Toast/index.vue";
import { saveComment } from "../../api/blog";
import Emoji from "../../components/Emoji/index.vue";
import EmojiList from "../../assets/js/emoji";

export default {
  name: "Reply",
  components: { Emoji, Toast },
  data() {
    return {
      // 是否显示表情包选择框
      emojiShow: false,
      // 网站配置信息
      website: this.$store.getters.website,
      // 网站其他信息
      websiteOther: this.$store.getters.websiteOther,
      // 用户昵称
      nickName: "",
      // 评论内容
      commentContent: "",
      // 用户身份
      identity: 1,
      // 回复人
      replyName: "",
      // 文章ID
      articleId: undefined,
      // 评论父ID
      parentId: undefined,
    };
  },

  mounted() {},

  methods: {
    // 取消回复
    cancleReply() {
      this.$refs.reply.style.display = "none";
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
        this.$refs.toast.error("请输入回复内容");
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
      // 提交评论信息;
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
      });
    },
  },
};
</script>

<style lang="scss" scoped>
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
  width: 100%;
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

.authorization {
  width: calc(100% - 40px);
  display: flex;
  justify-content: center;
  flex-direction: column;
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
.cancel-button {
  margin-right: 10px;
  border: none;
  background: #dcdfe6;
  color: #303133;
  border-radius: 5px;
  padding: 5px 18px;
  font-weight: 600;
}
.cancel-button:hover {
  transition: 0.5s;
  color: #fff;
  background: #909399;
}
</style>
