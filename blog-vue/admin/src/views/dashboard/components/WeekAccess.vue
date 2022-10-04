<template>
  <div class="proCharts" ref="charts" style="height: 330px"></div>
</template>

<script>
import echarts from "echarts";
import { getWeekViewData } from "@/api/blog.js";

export default {
  name: "WeekAccess",

  data() {
    return {
      dateData: [],
      countData: [],
    };
  },

  mounted() {
    this.getWeekView();
  },

  methods: {
    mycharts() {
      const option = {
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
          // data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
          data: this.dateData,
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
            // data: [100, 200, 95, 79, 143, 201, 105],
            data: this.countData,
            lineStyle: {
              // 折线的颜色
              color: "#36a3f7",
            },
            // 折线平滑
            smooth: true,
          },
        ],
      };
      // let myChart = echarts.init(this.$refs.charts, "macarons");
      let myChart = echarts.init(this.$refs.charts);
      myChart.setOption(option);
      //图表自适应
      window.addEventListener("resize", function () {
        myChart.resize(); // myChart 是实例对象
      });
    },
    async getWeekView() {
      await getWeekViewData().then((result) => {
        this.dateData = result.dateData;
        this.countData = result.countData;
        this.mycharts();
      });
    },
  },
};
</script>

<style lang="scss" scoped></style>
