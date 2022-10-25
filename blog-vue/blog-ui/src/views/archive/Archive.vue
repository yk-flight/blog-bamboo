<template>
  <div class="archive-container">
    <div class="archive-header" :style="cover">
      <span class="archive-title">文章归档</span>
    </div>
    <div class="archive-body">
      <timeline class="time-line">
        <timeline-title>
          <span class="article-title"> 归档存记忆，留史鉴未来！ </span>
        </timeline-title>
        <timeline-item v-for="item in archiveList" :key="item.id">
          <div class="timeline-container">
            <!-- 文章图片 -->
            <router-link :to="'/article/' + item.id">
              <img :src="item.background" width="120px" />
            </router-link>
            <!-- 文章信息 -->
            <div class="timeline-body">
              <div class="article-date">
                <span class="date-span">
                  {{ item.publishTime | date }}
                </span>
              </div>
              <div>
                <router-link :to="'/article/' + item.id" class="title-span">
                  {{ item.title }}
                </router-link>
              </div>
            </div>
          </div>
        </timeline-item>
      </timeline>

      <!-- 分页组件 -->
      <div style="text-align: center; margin: 30px 0">
        <paginate
          :page-count="pageCount"
          :prev-text="'上一页'"
          :next-text="'下一页'"
          :container-class="'paginate'"
          :page-class="'page-item'"
          :prev-class="'prev-item'"
          :prev-link-class="'prev-link-item'"
          :next-link-class="'next-link-item'"
          :active-class="'paginate-active'"
          :click-handler="handleClick"
        >
        </paginate>
      </div>
    </div>
  </div>
</template>

<script>
import { Timeline, TimelineItem, TimelineTitle } from "vue-cute-timeline";
import "vue-cute-timeline/dist/index.css";
import { getArchiveList } from "../../api/blog";

export default {
  name: "Archive",
  components: {
    Timeline,
    TimelineItem,
    TimelineTitle,
  },
  data() {
    return {
      // 文章归档数据
      archiveList: [],
      // 当前页数
      curPage: 1,
      // 页面大小
      size: 10,
      // 文章最大页数
      pageCount: 0,
    };
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取归档页的图片
      this.$store.getters.navBarList.forEach((item) => {
        if (item.label === "archive") {
          cover = item.image;
        }
      });
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {
    this.getArchiveInfo();
  },

  methods: {
    // 获取文章归档信息
    getArchiveInfo() {
      getArchiveList({
        curPage: this.curPage,
        size: this.size,
      }).then((result) => {
        let data = result.data;
        this.archiveList = data.list;
        this.pageCount = Math.ceil(data.total / this.size);
      });
    },
    // 点击页面切换按钮后执行的事件
    handleClick(e) {
      // 传来的参数为当前页数
      this.curPage = e;
      this.getArchiveInfo();
    },
  },
};
</script>

<style lang="scss" scoped>
.archive-container {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.archive-header {
  width: 100%;
  height: calc(40vh);
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.archive-title {
  color: #fff;
  font-size: 50px;
  font-weight: 500;
}
.archive-body {
  margin-top: 40px;
  width: 70%;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
  padding: 20px;
  min-height: calc(30vh);
}
.time-line {
  margin-left: 50px;
  margin-top: 50px;
}
.timeline-container {
  display: flex;
}
.timeline-body {
  margin-left: 20px;
}
.article-date {
  margin-top: 5px;
  margin-bottom: 8px;
}
.date-span {
  font-size: 15px;
  color: #606266;
  font-weight: 600;
}
.title-span {
  cursor: pointer;
  font-size: 16px;
  color: #303133;
  font-weight: 600;
  text-decoration: none;
}
.title-span:hover {
  transition: 0.8s;
  color: #409eff;
}
.article-title {
  font-size: 16px;
  color: #606266;
  font-weight: 600;
}
</style>
