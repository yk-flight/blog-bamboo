<template>
  <div class="website-container">
    <el-card shadow="never">
      <el-tabs v-model="activeName">
        <el-tab-pane label="网站设置" name="first">
          <webset></webset>
        </el-tab-pane>
        <el-tab-pane label="社交设置" name="second">
          <social-set></social-set>
        </el-tab-pane>
        <el-tab-pane label="其他设置" name="third">角色管理</el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script>
import Webset from "./components/Webset.vue";
import SocialSet from "./components/SocialSet.vue";

export default {
  name: "Website",
  components: { Webset, SocialSet },
  data() {
    return {
      activeName: "first",
    };
  },
  methods: {},
};
</script>

<style lang="scss" scoped>
.website-container {
  margin-top: 10px;
}
</style>
