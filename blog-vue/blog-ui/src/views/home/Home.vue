<template>
  <div class="home-container">
    <!--  博客Bnner  -->
    <Banner></Banner>
    <div class="home-body">
      <!-- git hub日历 -->
      <div class="home-github">
        <div class="github-header">
          <svg-icon icon="date-range"></svg-icon>
          Github日历
        </div>
        <img src="https://ghchart.rshah.org/Architect-Java" width="750px" />
      </div>

      <p>1</p>
      <p>1</p>
      <p>1</p>
      <p>1</p>
      <p>1</p>
      <p>1</p>
      <p>1</p>
      <p>1</p>
      <p>1</p>
      <p>1</p>
    </div>
  </div>
</template>

<script>
import Banner from "@/components/Banner/index.vue";

export default {
  name: "Home",
  components: { Banner },
};
</script>

<style lang="scss" scoped>
.home-container {
  height: 100%;
  width: 100%;
}
.home-body {
  height: 100%;
  width: 80%;
  background: #fff;
  margin: auto;
  display: flex;
  align-items: baseline;
  align-items: center;
  flex-direction: column;
}
.home-github {
  display: flex;
  align-items: baseline;
  align-items: center;
  flex-direction: column;
  margin-top: 20px;
  width: 800px;
  height: 230px;
  background: #fff;
  border-radius: 10px;
  box-shadow: 0 1px 20px -6px rgb(0 0 0 / 50%);
}
.github-header {
  font-size: 16px;
  margin-top: 20px;
  margin-bottom: 20px;
}
</style>
