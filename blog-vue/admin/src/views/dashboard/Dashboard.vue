<template>
  <div class="dashboard-container">
    <!-- 头部区域 -->
    <el-row :gutter="20" class="el-row-container">
      <!-- 热门文章和最近动态 -->
      <el-col :span="6">
        <!-- 热门文章 -->
        <el-row class="el-row-container">
          <el-card shadow="hover" style="height: 200px">
            <div class="span-title">热门文章</div>
            <div class="article-container">
              <div class="article-item">
                <span class="article-title" @click="onEditClick(1)">
                  第一篇测试文章
                </span>
                <div class="article-icon">
                  <el-tag>原创</el-tag>
                  <svg-icon icon="fire"></svg-icon>
                </div>
              </div>
              <div class="article-item">
                <span class="article-title" @click="onEditClick(1)">
                  第三篇测试文章
                </span>
                <div class="article-icon">
                  <el-tag>原创</el-tag>
                  <svg-icon icon="fire"></svg-icon>
                </div>
              </div>
              <div class="article-item">
                <span class="article-title" @click="onEditClick(1)">
                  第二篇测试文章
                </span>
                <div class="article-icon">
                  <el-tag>原创</el-tag>
                  <svg-icon icon="fire"></svg-icon>
                </div>
              </div>
            </div>
          </el-card>
        </el-row>
        <!-- 最近动态 -->
        <el-row>
          <el-card shadow="hover" style="height: 200px">
            <div class="span-title">最新动态</div>
            <div class="operation-container">
              <div class="operation-item">
                <div>
                  <span class="operation-title">世纪末的架构师</span>&nbsp;
                  <span>根据图片路径删除图片</span>
                </div>
                <div class="operation-date">2022-09-30 19:37:41</div>
              </div>
              <div class="operation-item">
                <div>
                  <span class="operation-title">世纪末的架构师</span>&nbsp;
                  <span>更新用户个人信息</span>
                </div>
                <div class="operation-date">2022-09-30 19:37:41</div>
              </div>
              <div class="operation-item">
                <div>
                  <span class="operation-title">世纪末的架构师</span>&nbsp;
                  <span>更新角色资源权限</span>
                </div>
                <div class="operation-date">2022-09-30 19:37:41</div>
              </div>
              <div class="operation-item">
                <div>
                  <span class="operation-title">世纪末的架构师</span>&nbsp;
                  <span>根据图片路径删除图片</span>
                </div>
                <div class="operation-date">2022-09-30 19:37:41</div>
              </div>
              <div class="operation-item">
                <div>
                  <span class="operation-title">世纪末的架构师</span>&nbsp;
                  <span>根据图片路径删除图片</span>
                </div>
                <div class="operation-date">2022-09-30 19:37:41</div>
              </div>
            </div>
          </el-card>
        </el-row>
      </el-col>

      <!-- 用户评论地区分布 -->
      <el-col :span="12">
        <el-card shadow="hover" style="height: 420px">
          <div class="span-title">访客地域分布</div>
          <china-map></china-map>
        </el-card>
      </el-col>

      <!-- 浏览量变化参数 -->
      <el-col :span="6">
        <!-- 浏览量 -->
        <el-row class="el-row-container">
          <el-card shadow="hover" style="height: 200px">
            <view-rank></view-rank>
          </el-card>
        </el-row>
        <!-- 其他信息参数 -->
        <el-row>
          <!-- 访问数量和文章数量 -->
          <el-row :gutter="20" class="el-row-container" style="height: 90px">
            <el-col :span="12">
              <el-card shadow="hover">
                <div class="view-container">
                  <svg-icon icon="peoples" class="icon-access"></svg-icon>
                  <div class="view-body">
                    <div class="font-title">访问数量</div>
                    <div class="font-num">10000</div>
                  </div>
                </div>
              </el-card>
            </el-col>
            <el-col :span="12">
              <el-card shadow="hover">
                <div class="view-container">
                  <svg-icon
                    icon="article-create"
                    class="icon-article"
                  ></svg-icon>
                  <div class="view-body">
                    <span class="font-title">文章数量</span>
                    <span class="font-num">10000</span>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>
          <!-- 留言数量和用户数量 -->
          <el-row :gutter="20" style="height: 90px">
            <el-col :span="12">
              <el-card shadow="hover">
                <div class="view-container">
                  <svg-icon icon="message" class="icon-message"></svg-icon>
                  <div class="view-body">
                    <span class="font-title">留言数量</span>
                    <span class="font-num">10000</span>
                  </div>
                </div>
              </el-card>
            </el-col>
            <el-col :span="12">
              <el-card shadow="hover">
                <div class="view-container">
                  <svg-icon icon="user" class="icon-user"></svg-icon>
                  <div class="view-body">
                    <span class="font-title">用户数量</span>
                    <span class="font-num">10000</span>
                  </div>
                </div>
              </el-card>
            </el-col>
          </el-row>
        </el-row>
      </el-col>
    </el-row>

    <!-- 主体区域 -->
    <el-row :gutter="20">
      <!-- 文章标签 -->
      <el-col :span="6">
        <el-card shadow="hover">
          <div class="span-title">文章标签统计</div>
          <word-cloud :tags="tags"></word-cloud>
        </el-card>
      </el-col>
      <!-- 文章分类 -->
      <el-col :span="8">
        <el-card shadow="hover">
          <pie-data></pie-data>
        </el-card>
      </el-col>
      <!-- 本周访问量 -->
      <el-col :span="10">
        <el-card shadow="hover">
          <week-access></week-access>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import PieData from "./components/PieData.vue";
import WordCloud from "./components/WordCloud.vue";
import ChinaMap from "./components/ChinaMap.vue";
import WeekAccess from "./components/WeekAccess.vue";
import ViewRank from "./components/ViewRank.vue";

export default {
  name: "Dashboard",
  components: { PieData, WordCloud, ChinaMap, WeekAccess, ViewRank },
  data() {
    return {
      tags: [
        "万事如意",
        "事事如意 ",
        "万事亨通",
        "一帆风顺",
        "万事大吉",
        "吉祥如意",
        "步步高升",
        "步步登高",
        "三羊开泰",
        "得心应手",
        "财源广进",
        "陶未媲美",
        "阖家安康",
        "龙马精神",
        "锦绣前程",
        "吉祥如意",
        "生龙活虎",
        "神采奕奕",
        "五谷丰登",
        "马到成功",
        "飞黄腾达",
        " 步步高升",
        "福禄寿禧",
      ],
    };
  },

  mounted() {},

  methods: {
    // 前往编辑文章页面
    onEditClick(id) {
      this.$router.push("/article/editor/" + id);
    },
  },
};
</script>

<style lang="scss" scoped>
.dashboard-container {
  height: 100%;
  width: 100%;
}
.el-row-container {
  margin-bottom: 20px;
}
.view-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.view-body {
  width: 50%;
  height: 100%;
}
.icon-access {
  color: #40c9c6;
  font-size: 50px;
}
.icon-article {
  color: #36a3f7;
  font-size: 50px;
}
.icon-message {
  color: #f4516c;
  font-size: 50px;
}
.icon-user {
  color: #34bfa3;
  font-size: 50px;
}
.font-title {
  margin-bottom: 5px;
  color: rgba(0, 0, 0, 0.45);
  font-size: 16px;
  font-weight: 700;
}
.font-num {
  color: #666;
  font-size: 15px;
  font-weight: 800;
}
.span-title {
  height: 30px;
  font-size: 18px;
  font-weight: 800;
}
.operation-container {
  padding-top: 10px;
}
.operation-item {
  font-size: 12px;
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
}
.operation-title {
  color: #409eff;
  font-weight: 500;
}
.operation-date {
  color: #909399;
  font-weight: 500;
}
.article-container {
  padding-top: 10px;
}
.article-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
  .article-icon {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .svg-icon {
    font-size: 16px;
    margin-left: 10px;
    color: red;
  }
}
.article-title {
  cursor: pointer;
  color: #303133;
}
.article-title:hover {
  transition: 0.5s;
  color: #409eff;
}
</style>
