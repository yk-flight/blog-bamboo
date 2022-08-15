<template>
  <div class="baseInfo-container">
    <el-form>
      <el-form-item prop="" label="昵称" label-width="60px">
        <el-input
          placeholder="用户昵称"
          v-model="this.$store.getters.userInfo.nickName"
          type="text"
        ></el-input>
      </el-form-item>
      <el-form-item prop="" label="邮箱" label-width="60px">
        <el-input
          placeholder="用户邮箱"
          v-model="this.$store.getters.userOtherInfo.email"
          type="text"
        ></el-input>
      </el-form-item>
      <el-form-item prop="" label="电话" label-width="60px">
        <el-input
          placeholder="联系电话"
          v-model="this.$store.getters.userOtherInfo.phone"
          type="text"
        ></el-input>
      </el-form-item>
      <el-form-item prop="" label="QQ" label-width="60px">
        <el-input
          placeholder="QQ账号"
          v-model="this.$store.getters.userOtherInfo.qq"
          type="text"
        ></el-input>
      </el-form-item>
      <el-form-item prop="" label="git hub" label-width="60px">
        <el-input
          placeholder="Github主页"
          v-model="this.$store.getters.userOtherInfo.github"
          type="text"
        ></el-input>
      </el-form-item>
      <el-form-item prop="" label="gitee" label-width="60px">
        <el-input
          placeholder="Gitee主页"
          v-model="this.$store.getters.userOtherInfo.gitee"
          type="text"
        ></el-input>
      </el-form-item>
      <el-form-item prop="" label="csdn" label-width="60px">
        <el-input
          placeholder="CSDN主页"
          v-model="this.$store.getters.userOtherInfo.csdn"
          type="text"
        ></el-input>
      </el-form-item>
      <el-form-item prop="" label="力扣" label-width="60px">
        <el-input
          placeholder="LeetCode主页"
          v-model="this.$store.getters.userOtherInfo.leetcode"
          type="text"
        ></el-input>
      </el-form-item>
      <el-form-item label="简介" label-width="60px">
        <el-input
          type="textarea"
          placeholder="这里输入自我介绍"
          v-model="this.$store.getters.userOtherInfo.description"
        ></el-input>
      </el-form-item>
      <el-form-item>
        <div class="button-container">
          <el-button type="primary" @click="submitUserInfoForm('userInfoForm')">
            保存
          </el-button>
          <el-button type="danger" @click="closeCurPage()"> 关闭 </el-button>
        </div>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "BaseInfo",
  data() {
    return {};
  },

  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.baseInfo-container {
  margin-top: 10px;

  .button-container {
    margin-top: 10px;
    text-align: center;
  }
}
</style>
