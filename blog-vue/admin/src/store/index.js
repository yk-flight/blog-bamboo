import Vue from "vue";
import Vuex from "vuex";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // 菜单是否折叠
    isCollapse: false,
    // 菜单路由
    routes: [],
  },
  mutations: {
    // 折叠侧边栏
    setCollapse: (state) => {
      state.isCollapse = !state.isCollapse;
    },
    // 初始化菜单路由
    initRoutes(state, data) {
      state.routes = data;
    },
  },
  actions: {},
  modules: {},
});
