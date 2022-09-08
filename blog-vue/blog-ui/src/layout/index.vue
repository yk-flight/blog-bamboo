<template>
  <div class="home-container">
    <!--  博客Bnner  -->
    <!-- <Banner></Banner> -->
    <router-view />
    <!-- 页脚 -->
    <!-- <Footer></Footer> -->
  </div>
</template>

<script>
import Banner from "@/components/Banner/index.vue";
import Footer from "@/layout/Footer/index.vue";

export default {
  name: "Layout",
  components: { Footer, Banner },
  data() {
    return {};
  },

  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped>
.home-container {
  height: 100%;
  background-image: url("../assets/images/home.jpg");
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;
}
</style>
