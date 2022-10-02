<template>
  <div class="pie-container">
    <div ref="charts" id="mychart" :style="myChartStyle"></div>
  </div>
</template>

<script>
import echarts from "echarts";

export default {
  name: "PieData",

  data() {
    return {
      myChart: {},
      pieData: [
        {
          value: 463,
          name: "江苏",
        },
        {
          value: 395,
          name: "浙江",
        },
        {
          value: 157,
          name: "山东",
        },
        {
          value: 149,
          name: "广东",
        },
        {
          value: 147,
          name: "湖南",
        },
      ],
      pieName: [],
      myChartStyle: { width: "100%", height: "350px" }, //图表样式
    };
  },

  mounted() {
    this.initDate(); //数据初始化
    this.initEcharts();
  },

  methods: {
    initDate() {
      for (let i = 0; i < this.pieData.length; i++) {
        this.pieName[i] = this.pieData[i].name;
      }
    },
    initEcharts() {
      // 饼图
      const option = {
        color: [
          "#5470c6",
          "#91cc75",
          "#fac858",
          "#ee6666",
          "#73c0de",
          "#3ba272",
          "#fc8452",
          "#9a60b4",
          "#ea7ccc",
        ],
        legend: {
          data: this.pieName,
          bottom: "bottom",
        },
        title: {
          // 设置饼图标题，位置设为顶部居左
          text: "文章分类统计",
          top: "0%",
          left: "left",
        },
        tooltip: {
          trigger: "item",
        },
        series: [
          {
            type: "pie",
            label: {
              show: true,
            },
            radius: "60%", //饼图半径
            data: this.pieData,
          },
        ],
      };
      this.myChart = echarts.init(this.$refs.charts);
      this.myChart.setOption(option);
      //随着屏幕大小调节图表
      window.addEventListener("resize", () => {
        this.myChart.resize();
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.pie-container {
  width: 100%;
  height: 100%;
}
</style>
