<template>
  <div style="display: flex; justify-content: center">
    <div id="map-china" style="width: 100%; height: 350px"></div>
  </div>
</template>

<script>
// 引入echarts
import echarts from "echarts";
// 引入中国地图js
import "echarts/map/js/china.js";

export default {
  name: "ChinaMap",

  data() {
    return {};
  },

  mounted() {
    this.initMap();
  },

  methods: {
    initMap() {
      // 初始化echarts实例
      this.chinachart = echarts.init(document.getElementById("map-china"));
      // 进行相关配置
      this.chartOption = {
        // geo配置详解： https://echarts.baidu.com/option.html#geo
        geo: {
          // 地理坐标系组件用于地图的绘制
          map: "china", // 表示中国地图
          // roam: true, // 是否开启鼠标缩放和平移漫游
          zoom: 1.2, // 当前视角的缩放比例（地图的放大比例）
          itemStyle: {
            // 地图区域的多边形 图形样式。
            borderColor: "rgba(0, 0, 0, 0.2)",
            emphasis: {
              // 高亮状态下的多边形和标签样式
              shadowBlur: 20,
              shadowColor: "rgba(0, 0, 0, 0.5)",
            },
          },
        },
        series: [
          {
            name: "当前区域访问人数", // 浮动框的标题（上面的formatter自定义了提示框数据，所以这里可不写）
            type: "map",
            geoIndex: 0,
            label: {
              show: true,
            },
            // 这是需要配置地图上的某个地区的数据（下面是定义的假数据）
            data: [
              { name: "湖南", value: 3957 },
              { name: "北京", value: 2665 },
              { name: "上海", value: 1647 },
              { name: "江西", value: 79 },
              { name: "河南", value: 1592 },
              { name: "山西", value: 80 },
              { name: "四川", value: 1399 },
              { name: "湖北", value: 1194 },
              { name: "江苏", value: 1162 },
              { name: "内蒙古", value: 1152 },
              { name: "安徽", value: 354 },
              { name: "辽宁", value: 719 },
              { name: "广东", value: 1697 },
              { name: "浙江", value: 602 },
              { name: "济南", value: 535 },
              { name: "陕西", value: 516 },
              { name: "贵州", value: 470 },
              { name: "山东", value: 429 },
              { name: "云南", value: 429 },
              { name: "广西", value: 421 },
              { name: "吉林", value: 400 },
              { name: "南京", value: 353 },
              { name: "重庆", value: 337 },
              { name: "黑龙江", value: 282 },
              { name: "海南", value: 7 },
              { name: "新疆", value: 279 },
              { name: "福建", value: 213 },
              { name: "河北", value: 192 },
              { name: "天津", value: 166 },
              { name: "宁夏", value: 3 },
              { name: "甘肃", value: 8 },
              { name: "青海", value: 11 },
              { name: "西藏", value: 2 },
            ],
          },
        ],
        tooltip: {
          // 鼠标移到图里面的浮动提示框
          backgroundColor: "#C0C4CC", //提示标签背景颜色
          textStyle: { color: "#fff" }, //提示标签字体颜色
        },
        // visualMap的详细配置解析：https://echarts.baidu.com/option.html#visualMap
        visualMap: {
          // 左下角的颜色区域
          type: "piecewise", // 定义为分段型 visualMap
          min: 0,
          max: 1000,
          itemWidth: 40,
          bottom: 10,
          left: 10,
          pieces: [
            // 自定义『分段式视觉映射组件（visualMapPiecewise）』的每一段的范围，
            // 以及每一段的文字，以及每一段的特别的样式
            { gt: 100, label: ">101人", color: "#409EFF" }, // (100, ]
            { gt: 50, lte: 100, label: "51-100人", color: "#67C23A" }, // (50, 100]
            { gt: 10, lte: 50, label: "10-50人", color: "#E6A23C" }, // (10, 50]
            { gt: 0, lte: 10, label: "1-10人", color: "#F56C6C" }, // (0, 10]
          ],
        },
      };
      // 使用刚指定的配置项和数据显示地图数据
      this.chinachart.setOption(this.chartOption);
    },
  },
};
</script>

<style lang="scss" scoped></style>
