<template>
  <div class="dashboard-container">
    <!-- 头部区域 -->
    <el-row :gutter="20" class="el-row-container">
      <!-- 热门文章和最近动态 -->
      <el-col :span="6">
        <!-- 热门文章 -->
        <el-row class="el-row-container">
          <el-card shadow="hover" style="height: 200px">
            <div class="span-title">最新评论</div>
            <div class="message-container">
              <div class="message-item" v-for="item in comments" :key="item.id">
                <router-link to="/information/comment" class="message-title">
                  {{ item.nickName }}
                </router-link>
                <div class="message-content">
                  {{ item.content }}
                </div>
                <div class="message-date">
                  {{ item.messageTime | dateFilter }}
                </div>
              </div>
            </div>
          </el-card>
        </el-row>
        <!-- 最近动态 -->
        <el-row>
          <el-card shadow="hover" style="height: 200px">
            <div class="span-title">最新动态</div>
            <div class="message-container">
              <div
                class="message-item"
                v-for="item in operateLogs"
                :key="item.id"
              >
                <span class="message-title"> {{ item.user }} </span>
                <span class="message-content">
                  {{ item.description }}
                </span>
                <div class="message-date">
                  {{ item.operateTime | dateFilter }}
                </div>
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
        <!-- 最新留言 -->
        <el-row class="el-row-container">
          <el-card shadow="hover" style="height: 200px">
            <div class="span-title">最新留言</div>
            <div class="message-container">
              <div class="message-item" v-for="item in messages" :key="item.id">
                <router-link to="/information/message" class="message-title">
                  {{ item.nickName }}
                </router-link>
                <div class="message-content">
                  {{ item.content }}
                </div>
                <div class="message-date">
                  {{ item.messageTime | dateFilter }}
                </div>
              </div>
            </div>
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
                    <div class="font-num">
                      {{ accessNum }}
                    </div>
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
                    <span class="font-num">
                      {{ articleNum }}
                    </span>
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
                    <span class="font-num">
                      {{ messageNum }}
                    </span>
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
                    <span class="font-num">
                      {{ userNum }}
                    </span>
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
          <word-cloud :tags="tags" v-if="tags.length > 0"></word-cloud>
        </el-card>
      </el-col>
      <!-- 文章分类 -->
      <el-col :span="8">
        <el-card shadow="hover">
          <pie-data
            :pieData="categories"
            v-if="categories.length > 0"
          ></pie-data>
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
import { getBlogInfo } from "@/api/blog.js";
import PieData from "./components/PieData.vue";
import WordCloud from "./components/WordCloud.vue";
import ChinaMap from "./components/ChinaMap.vue";
import WeekAccess from "./components/WeekAccess.vue";

export default {
  name: "Dashboard",
  components: { PieData, WordCloud, ChinaMap, WeekAccess },
  data() {
    return {
      // 标签内容
      tags: [],
      // 文章数量
      articleNum: 0,
      // 访问数量
      accessNum: 0,
      // 留言数量
      messageNum: 0,
      // 用户数量
      userNum: 0,
      // 最新动态
      operateLogs: [],
      // 分类集合
      categories: [],
      // 最新评论
      comments: [],
      // 最新留言
      messages: [],
    };
  },

  created() {
    this.getData();
  },
  methods: {
    getData() {
      getBlogInfo().then((result) => {
        // 文章数量
        this.articleNum = result.articleNum;
        // 访问数量
        this.accessNum = result.accessNum;
        // 留言数量
        this.messageNum = result.messageNum;
        // 用户数量
        this.userNum = result.userNum;
        // 文章标签
        this.tags = result.tags;
        // 最新动态
        this.operateLogs = result.operateLogs;
        // 文章分类
        this.categories = result.categories;
        // 最新评论
        this.comments = result.comments;
        // 最新留言
        this.messages = result.messages;
      });
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
  height: 100%;
  display: flex;
  flex-direction: column;
}
.icon-access {
  color: #40c9c6;
  font-size: 40px;
}
.icon-article {
  color: #36a3f7;
  font-size: 40px;
}
.icon-message {
  color: #f4516c;
  font-size: 40px;
}
.icon-user {
  color: #34bfa3;
  font-size: 40px;
}
.font-title {
  margin-bottom: 5px;
  color: rgba(0, 0, 0, 0.45);
  font-size: 1rem;
  font-weight: 700;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
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
.comment-title {
  font-size: 12px;
  cursor: pointer;
  color: #303133;
  width: 36%;
  margin-right: 10px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  -webkit-line-clamp: 1;
}
.comment-title:hover {
  transition: 0.5s;
  color: #409eff;
}
.comment-date {
  color: #909399;
  font-weight: 500;
  font-size: 12px;
  width: 40%;
}
.message-container {
  padding-top: 10px;
}
.message-title {
  font-size: 12px;
  cursor: pointer;
  color: #303133;
  width: 36%;
  margin-right: 10px;
  font-weight: 500;
  color: #409eff;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  -webkit-line-clamp: 1;
}
.message-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 8px;
}
.message-title:hover {
  transition: 0.5s;
  color: #4045ff;
}
.message-date {
  color: #909399;
  font-weight: 500;
  font-size: 12px;
  width: 40%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  -webkit-line-clamp: 1;
}
.message-content {
  width: 40%;
  font-size: 12px;
  margin-right: 20px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  -webkit-line-clamp: 1;
}
</style>
