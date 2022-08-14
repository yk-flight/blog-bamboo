import Vue from "vue";
import Vuex from "vuex";
import router from "@/router/index";
import getters from "./getter";

import app from "./modules/app";
import permission from "./modules/permisssion";
import user from "./modules/user";

Vue.use(Vuex);

export default new Vuex.Store({
  actions: {
    // 退出登录
    logout() {
      router.push("/login");
    },
  },
  getters,
  modules: {
    app,
    permission,
    user,
  },
});
