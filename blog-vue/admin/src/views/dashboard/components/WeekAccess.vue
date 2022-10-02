<template>
  <div class="proCharts" ref="charts" style="height: 350px"></div>
</template>

<script>
import echarts from "echarts";

export default {
  name: "WeekAccess",

  data() {
    return {
      option: {
        color: ["#36a3f7"],
        title: {
          text: "本周访问量",
        },
        tooltip: {
          //提示框
          trigger: "axis",
        },
        legend: {
          data: [
            {
              name: "访问量",
            },
          ],
        },
        grid: {
          left: "3%",
          right: "4%",
          bottom: "3%",
          top: "17%",
          containLabel: true, //grid区域是否包含坐标轴的刻度标签
        },
        xAxis: {
          type: "category", //坐标轴类型。
          data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
          axisLabel: {
            //坐标轴刻度标签的相关设置
            interval: 0,
            textStyle: {
              fontSize: 13,
            },
          },
        },
        yAxis: {
          type: "value",
          axisLabel: {
            //x轴的坐标文字
            show: true,
            textStyle: {
              fontSize: 13,
            },
          },
        },
        series: [
          {
            name: "访问量",
            type: "line",
            data: [100, 200, 95, 79, 143, 201, 105],
            lineStyle: {
              // 折线的颜色
              color: "#36a3f7",
            },
            // 折线平滑
            smooth: true,
          },
        ],
      },
    };
  },

  mounted() {
    this.mycharts();
  },

  methods: {
    mycharts() {
      let myChart = echarts.init(this.$refs.charts, "macarons");
      myChart.setOption(this.option);
      //图表自适应
      window.addEventListener("resize", function () {
        myChart.resize(); // myChart 是实例对象
      });
    },
  },
};
</script>

<style lang="scss" scoped></style>
