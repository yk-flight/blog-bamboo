<template>
  <div class="message-container">
    <div class="message-header" :style="cover">
      <span class="message-title">留言板</span>
      <div class="input-container">
        <input
          type="text"
          placeholder="留下点什么吧"
          class="input-warpper"
          style="width: 95%"
          v-model="content"
        />

        <div style="width: 100%">
          <input
            type="text"
            placeholder="输入一个喜欢的昵称吧"
            class="input-warpper"
            v-model="nickName"
          />
          <a class="input-button" @click="handleClick">发送</a>
        </div>
      </div>
    </div>
    <!-- 弹幕列表 -->
    <div class="message-body">
      <vue-baberrage :barrageList="barrageList" :loop="true">
        <template v-slot:default="slotProps">
          <span class="message-item">
            <img
              :src="slotProps.item.avatar"
              width="30"
              height="30"
              style="border-radius: 50%"
            />
            <span style="margin-left: 10px">
              {{ slotProps.item.nickName }} :
            </span>
            <span style="margin-left: 10px">
              {{ slotProps.item.content }}
            </span>
          </span>
        </template>
      </vue-baberrage>
    </div>

    <toast ref="toast"></toast>
  </div>
</template>

<script>
import Toast from "../../components/Toast/index.vue";
import { MESSAGE_TYPE } from "vue-baberrage";
import { getMessageList, saveMessage } from "../../api/blog";

export default {
  name: "Message",
  components: { Toast },
  data() {
    return {
      barrageList: [],
      // 网站其他信息
      websiteOther: this.$store.getters.websiteOther,
      // 用户昵称
      nickName: "",
      // 留言内容
      content: "",
    };
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取留言页的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "message") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {
    this.addBarrageList();
  },

  methods: {
    // 将列表信息添加到弹幕中
    addBarrageList() {
      getMessageList().then((result) => {
        // 循环获取当前返回数据
        result.data.forEach((item) => {
          this.barrageList.push({
            avatar: this.websiteOther.avatar,
            nickName: item.nickName,
            content: item.content,
            time: Math.floor(Math.random() * (10 - 7)) + 8,
            type: MESSAGE_TYPE.NORMAL,
          });
        });
      });
    },
    // 发送留言点击事件
    handleClick() {
      // 非空判断
      if (this.nickName.trim() == "") {
        this.$refs.toast.error("请输入昵称");
        return;
      }
      if (this.content.trim() == "") {
        this.$refs.toast.error("留言不可以为空哦");
        return;
      }
      // 定义留言对象
      var message = {
        avatar: this.websiteOther.avatar,
        nickName: this.nickName,
        content: this.content,
        time: Math.floor(Math.random() * (10 - 7)) + 8,
        type: MESSAGE_TYPE.NORMAL,
      };
      // 保存留言
      saveMessage({ nickName: this.nickName, content: this.content }).then(
        (result) => {
          let data = result.data;
          if (data.code == 200) {
            // 当留言信息添加成功时判断是否通过审核
            if (!data.data) {
              this.barrageList.push(message);
            }
            this.$refs.toast.binxs(data.message);
          } else {
            this.$refs.toast.error(data.message);
          }
          // 将当前留言内容清除
          this.content = "";
        }
      );
    },
  },
};
</script>

<style lang="scss" scoped>
.message-container {
  overflow: hidden;
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.message-header {
  width: 100%;
  height: calc(100vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.message-title {
  color: #fff;
  font-size: 50px;
  font-weight: 500;
  margin-bottom: 20px;
}
.message-body {
  position: absolute;
  top: 50px;
  left: 0;
  right: 0;
  bottom: 0;
  height: calc(100% -50px);
  width: 100%;
}
.message-item {
  background: rgb(0, 0, 0, 0.7);
  border-radius: 100px;
  color: #fff;
  padding: 5px 10px 5px 5px;
  align-items: center;
  display: flex;
}
.input-container {
  z-index: 1;
  display: flex;
  align-items: center;
  flex-direction: column;
  .input-warpper {
    width: 250px;
    border: 2px #e4e7ed solid;
    margin: 3px 3px 10px 10px;
    padding-left: 20px;
    height: 35px;
    border-radius: 20px;
    background: none;
    color: #fff;
    font-size: 15px;
  }
  .input-warpper:focus {
    transition: 0.5s;
    outline: none;
    border: 2px #409eff solid;
  }
}
.input-button {
  color: #fff;
  border: 2px #e4e7ed solid;
  margin-left: 20px;
  padding: 5px 15px;
  border-radius: 10px;
}
::-webkit-input-placeholder {
  color: #fff;
}
:-ms-input-placeholder {
  color: #fff;
}
:-moz-placeholder,
::-moz-placeholder {
  color: #fff;
  opacity: 1;
}
</style>
