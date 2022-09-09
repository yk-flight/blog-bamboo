import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
// ======================= 导入组件 ========================
import VueTypedJs from "vue-typed-js";
import animate from "animate.css";
import SvgIcons from "@/icons";
import NProgress from "nprogress";
// ======================= 导入样式 ========================
import "./styles/index.scss";
import "nprogress/nprogress.css";

Vue.config.productionTip = false;

Vue.use(animate);
Vue.use(SvgIcons);
Vue.use(VueTypedJs);

// 调整进度条的速度
NProgress.configure({ easing: "ease", speed: 400 });

// 路由导航守卫
// to：当前位置，from：从哪来
router.beforeEach(async (to, from, next) => {
  // 开启页面进度条
  NProgress.start();
  // 修改网站的标题
  window.document.title = "世纪末的架构师｜" + to.meta.title;

  // 放行
  next();
});

router.afterEach((to, from) => {
  // 切换路由时返回到顶部
  window.scrollTo(0, 0);
  // 关闭进度条
  NProgress.done();
});

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
