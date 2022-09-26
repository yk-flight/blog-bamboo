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
        <el-tab-pane label="其他设置" name="third">
          <other-info></other-info>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script>
import Webset from "./components/Webset.vue";
import SocialSet from "./components/SocialSet.vue";
import OtherInfo from "./components/OtherInfo.vue";

export default {
  name: "Website",
  components: { Webset, SocialSet, OtherInfo },
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
