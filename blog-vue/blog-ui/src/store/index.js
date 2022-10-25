import Vue from "vue";
import Vuex from "vuex";
import getters from "./getter";

import navbar from "./modules/navbar";
import config from "./modules/config";

Vue.use(Vuex);

export default new Vuex.Store({
  getters,
  modules: {
    navbar,
    config,
  },
});
