import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
// ======================= 导入组件 ========================
import animate from "animate.css";
import SvgIcons from "@/icons";
// ======================= 导入样式 ========================
import "./styles/index.scss";

Vue.config.productionTip = false;

Vue.use(animate);
Vue.use(SvgIcons);

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
