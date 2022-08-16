<template>
  <div>
    <el-form>
      <el-form-item label="原密码" label-width="80px">
        <el-input
          v-model="this.$store.getters.userInfo.password"
          type="password"
        ></el-input>
      </el-form-item>
      <el-form-item label="新密码" label-width="80px">
        <el-input v-model="newPassword" type="password"></el-input>
      </el-form-item>
      <el-form-item>
        <div class="button-container">
          <el-button type="primary"> 修改 </el-button>
        </div>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  name: "ChangePass",

  data() {
    return {
      newPassword: "",
    };
  },

  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.button-container {
  margin-top: 10px;
  text-align: center;
}
</style>
