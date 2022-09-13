<template>
  <div>
    <el-row class="title">
      <span class="social-title">
        当前页面只进行社交信息是否展示的编辑，前往
        <router-link to="/profile">个人中心</router-link>
        可以对社交信息进行编辑
      </span>
    </el-row>
    <el-row>
      <el-form label-position="left" label-width="75px">
        <!--  Github信息  -->
        <el-form-item label="Github：">
          <el-row :gutter="40">
            <el-col :span="9">
              <el-input
                placeholder="输先设置Github主页"
                size="small"
                :value="this.$store.getters.userOtherInfo.github"
              ></el-input>
            </el-col>
            <el-col :span="5">
              <el-radio-group v-model="social.githubShow">
                <el-radio :label="true">展示</el-radio>
                <el-radio :label="false">不展示</el-radio>
              </el-radio-group>
            </el-col>
          </el-row>
        </el-form-item>
        <!--  Gitee信息  -->
        <el-form-item label="Gitee：">
          <el-row :gutter="40">
            <el-col :span="9">
              <el-input
                placeholder="输先设置Gitee主页"
                size="small"
                :value="this.$store.getters.userOtherInfo.gitee"
              ></el-input>
            </el-col>
            <el-col :span="5">
              <el-radio-group v-model="social.giteeShow">
                <el-radio :label="true">展示</el-radio>
                <el-radio :label="false">不展示</el-radio>
              </el-radio-group>
            </el-col>
          </el-row>
        </el-form-item>
        <!--  CSDN信息  -->
        <el-form-item label="CSDN">
          <el-row :gutter="40">
            <el-col :span="9">
              <el-input
                placeholder="输先设置CSDN主页"
                size="small"
                :value="this.$store.getters.userOtherInfo.csdn"
              ></el-input>
            </el-col>
            <el-col :span="5">
              <el-radio-group v-model="social.csdnShow">
                <el-radio :label="true">展示</el-radio>
                <el-radio :label="false">不展示</el-radio>
              </el-radio-group>
            </el-col>
          </el-row>
        </el-form-item>
        <!--  LeetCode信息  -->
        <el-form-item label="LeetCode：">
          <el-row :gutter="40">
            <el-col :span="9">
              <el-input
                placeholder="输先设置LeetCode主页"
                size="small"
                :value="this.$store.getters.userOtherInfo.leetcode"
              ></el-input>
            </el-col>
            <el-col :span="5">
              <el-radio-group v-model="social.leetcodeShow">
                <el-radio :label="true">展示</el-radio>
                <el-radio :label="false">不展示</el-radio>
              </el-radio-group>
            </el-col>
          </el-row>
        </el-form-item>
        <el-form-item>
          <div>
            <el-button type="primary" @click="handleUpadte"> 修改 </el-button>
          </div>
        </el-form-item>
      </el-form>
    </el-row>
  </div>
</template>

<script>
import { getSocialInfo, updateSocialInfo } from "@/api/website.js";

export default {
  name: "SocialSet",

  data() {
    return {
      radio: 3,
      social: {
        // 是否展示Github
        githubShow: undefined,
        // 是否展示Gitee
        giteeShow: undefined,
        // 是否展示CSDN
        csdnShow: undefined,
        // 是否展示LeetCode
        leetcodeShow: undefined,
        // 是否展示QQ
        qqShow: undefined,
      },
    };
  },

  mounted() {
    this.getData();
  },

  methods: {
    // 获取数据
    getData() {
      getSocialInfo().then((result) => {
        this.social = result;
      });
    },
    // 点击修改按钮
    handleUpadte() {
      updateSocialInfo(this.social).then((result) => {
        // 更新当前数据
        this.getData();
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.social-title {
  text-decoration: none;
  font-size: 12px;
  color: #303133;
}
.social-title a {
  color: #409eff;
}
.title {
  margin-bottom: 20px;
}
</style>
