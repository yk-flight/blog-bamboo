import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import store from "./store";

import ElementUI from "element-ui";
// ======================= 导入样式 ========================
import "./styles/index.css";
import "nprogress/nprogress.css";
import "element-ui/lib/theme-chalk/index.css";

import {
  getRequest,
  postRequest,
  putRequest,
  deleteRequest,
} from "@/utils/api.js";

import SvgIcons from "@/icons";

Vue.use(ElementUI);
Vue.use(SvgIcons);
// ======================= 定义请求操作作为插件在全局使用 ========================
Vue.prototype.postRequest = postRequest;
Vue.prototype.getRequest = getRequest;
Vue.prototype.putRequest = putRequest;
Vue.prototype.deleteRequest = deleteRequest;

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount("#app");
