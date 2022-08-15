<template>
  <div class="dashboard-container">
    <!-- 头部视图 -->
    <top-view></top-view>
    <!-- 访问量折线图 -->
    <body-view></body-view>
  </div>
</template>

<script>
import TopView from "./components/TopView.vue";
import BodyView from "./components/BodyView.vue";

export default {
  name: "Dashboard",
  components: { TopView, BodyView },
  data() {
    return {};
  },

  mounted() {},

  methods: {},
};
</script>

<style>
.dashboard-container {
  height: 100%;
  width: 100%;
}
</style>
