import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
// ======================= 导入组件 ========================
import axios from "axios";
import VueTypedJs from "vue-typed-js";
import animate from "animate.css";
import SvgIcons from "@/icons";
import NProgress from "nprogress";
import mavonEditor from "mavon-editor";
import dayjs from "dayjs";
import Share from "vue-social-share";
import { vueBaberrage } from "vue-baberrage";
import VueImageSwipe from "vue-image-swipe";
import Paginate from "vuejs-paginate";
// ======================= 导入样式 ========================
import "./styles/index.scss";
import "./assets/css/markdown.css";
import "highlight.js/styles/atom-one-dark.css";
import "nprogress/nprogress.css";
import "mavon-editor/dist/css/index.css";
import "./assets/css/vue-social-share/client.css";
import "vue-image-swipe/dist/vue-image-swipe.css";

Vue.config.productionTip = false;
Vue.prototype.$axios = axios;

Vue.use(animate);
Vue.use(SvgIcons);
Vue.use(VueTypedJs);
Vue.use(mavonEditor);
Vue.use(vueBaberrage);
Vue.use(Share);
Vue.use(VueImageSwipe);

Vue.component("paginate", Paginate);

// 调整进度条的速度
NProgress.configure({ easing: "ease", speed: 400 });

// 路由导航守卫
// to：当前位置，from：从哪来
router.beforeEach(async (to, from, next) => {
  // 开启页面进度条
  NProgress.start();
  // 修改网站的标题
  if (to.meta.title) {
    window.document.title = to.meta.title;
  }
  // 放行
  next();
});

router.afterEach((to, from) => {
  // 切换路由时返回到顶部
  window.scrollTo({
    top: 0,
    behavior: "instant",
  });
  // 关闭进度条
  NProgress.done();
});

//========================= 添加全局过滤器 =========================
Vue.filter("date", function (value) {
  return dayjs(value).format("YYYY-MM-DD");
});

Vue.filter("year", function (value) {
  return dayjs(value).format("YYYY");
});

Vue.filter("hour", function (value) {
  return dayjs(value).format("HH:mm:ss");
});

Vue.filter("time", function (value) {
  return dayjs(value).format("YYYY-MM-DD HH:mm:ss");
});

Vue.filter("num", function (value) {
  if (value >= 1000) {
    return (value / 1000).toFixed(1) + "k";
  }
  return value;
});
new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
