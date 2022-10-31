<template>
  <div v-if="websiteOther.musicShow">
    <meting-js
      server="tencent"
      type="playlist"
      :id="websiteOther.musicId"
      fixed="true"
      :autoplay="websiteOther.musicAuto"
      loop="all"
      order="list"
      preload="auto"
      list-folded="true"
      list-max-height="500px"
      lrc-type="1"
    >
    </meting-js>
  </div>
</template>

<script>
export default {
  name: "Music",

  data() {
    return {
      // 网站其他配置信息
      websiteOther: this.$store.getters.websiteOther,
    };
  },

  mounted() {},

  methods: {},
};
</script>

<style lang="scss" scoped></style>
