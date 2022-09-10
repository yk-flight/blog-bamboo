<template>
  <div class="website-container">
    <el-card shadow="never">
      <el-tabs v-model="activeName" @tab-click="handleClick">
        <el-tab-pane label="网站设置" name="first">
          <webset></webset>
        </el-tab-pane>
        <el-tab-pane label="社交设置" name="second">配置管理</el-tab-pane>
        <el-tab-pane label="其他设置" name="third">角色管理</el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script>
import Webset from "./components/Webset.vue";

export default {
  name: "Website",
  components: { Webset },
  data() {
    return {
      activeName: "first",
    };
  },
  methods: {
    handleClick(tab, event) {
      console.log(tab, event);
    },
  },
};
</script>

<style lang="scss" scoped>
.website-container {
  margin-top: 10px;
}
</style>
