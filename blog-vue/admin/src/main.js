import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";
// ======================= 导入外部组件 ========================
import ElementUI from "element-ui";
// ======================= 导入样式 ========================
import "./styles/index.scss";
import "nprogress/nprogress.css";
import "element-ui/lib/theme-chalk/index.css";

import "./permission";

import SvgIcons from "@/icons";
import filters from "@/filter/index";

Vue.use(ElementUI);
Vue.use(SvgIcons);

Vue.config.productionTip = false;

Object.keys(filters).forEach((key) => {
  Vue.filter(key, filters[key]);
});

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
