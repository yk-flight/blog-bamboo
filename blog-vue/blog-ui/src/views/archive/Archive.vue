<template>
  <div class="archive-container">
    <div class="archive-header" :style="cover">
      <h1 class="archive-title">归档</h1>
    </div>
    <div class="archive-body">
      <span class="archive-date">时间轴 ( 月 )</span>
      <div class="container">
        <div class="container__line"></div>
        <ul class="container__items">
          <!-- 单个时间节点 -->
          <li class="container__item">
            <div class="container__top">
              <!--  圆圈  -->
              <div class="container__circle"></div>
              <!-- 归档标题 -->
              <div class="container__title">2021 年 11 月</div>
            </div>
            <!-- 归档博客 -->
            <div class="container__desc">Docker与Docker Compose的安装</div>
            <div class="container__desc">Docker基础学习笔记</div>
            <div class="container__desc">Docker命令学习笔记</div>
          </li>

          <li class="container__item">
            <div class="container__top">
              <div class="container__circle"></div>
              <div class="container__title">2021 年 1 月</div>
            </div>
            <div class="container__desc">线性表顺序表示和实现（C语言)</div>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Archive",

  data() {
    return {};
  },
  computed: {
    cover() {
      // 定义要拼接的CSS
      let cover = "";
      // 循环获取归档页的图片
      cover = "https://z3.ax1x.com/2021/11/16/Ifuh6J.jpg";
      console.log(
        "background: url(" + cover + ") center center / cover no-repeat"
      );
      // 返回对应的CSS
      return "background: url(" + cover + ") center center / cover no-repeat";
    },
  },
  mounted() {},

  methods: {},
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
  // justify-content: center;
  align-items: center;
}
.archive-header {
  width: 100%;
  height: 40%;
  background: #fff;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}
.archive-title {
  color: #fff;
  font-size: 40px;
  letter-spacing: 8px;
}
.archive-body {
  margin-top: 40px;
  width: 70%;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
  background-color: #fff;
  display: flex;
  flex-direction: column;
}
.archive-date {
  margin-top: 50px;
  margin-bottom: 30px;
  text-align: center;
  font-size: 18px;
  font-weight: 600;
}
.container {
  position: relative;
  margin-left: 30px;
  margin-bottom: 50px;
  padding-left: 50px;
  width: 30%;
}

.container__line {
  border-right: 2px solid #c0c4cc;
  padding-left: 43px;
  left: 16px;
  position: absolute;
  top: 0px;
  height: 100%;
}

.container__items {
  list-style-type: none;
  margin: 0px;
  padding: 0px;
}

.container__item {
  margin-bottom: 8px;
}

.container__top {
  align-items: center;
  display: flex;
}

.container__circle {
  background-color: #c0c4cc;
  border-radius: 50%;
  height: 20px;
  width: 20px;
}

.container__title {
  margin-left: 20px;
  flex: 1;
  color: #909399;
  font-size: 15px;
}

.container__desc {
  margin-left: 48px;
  margin-top: 10px;
  margin-bottom: 10px;
  color: rgb(96, 98, 102);
  font-size: 13px;
}
</style>
