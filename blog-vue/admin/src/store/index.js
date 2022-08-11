import Vue from "vue";
import Vuex from "vuex";
import router from "@/router/index";

import { TAGS_VIEW } from "@/constant";
import { getItem, setItem, removeAllItem } from "@/utils/storage";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // 菜单是否折叠
    isCollapse: false,
    // 菜单路由
    routes: [],
    // 标签页
    tagsViewList: getItem(TAGS_VIEW) || [
      {
        fullPath: "/dashboard",
        name: "dashboard",
        path: "/dashboard",
        meta: {
          title: "dashboard",
          icon: "dashboard",
        },
        title: "仪表盘",
      },
    ],
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
    // 添加标签页
    addTagsViewList(state, tag) {
      const isFind = state.tagsViewList.find((item) => {
        return item.path === tag.path;
      });
      // 处理重复
      if (!isFind) {
        // 如果不存在重复的标签页
        state.tagsViewList.push(tag);
        setItem(TAGS_VIEW, state.tagsViewList);
      }
    },
    // 为指定的 tag 修改 title
    changeTagsView(state, { index, tag }) {
      state.tagsViewList[index] = tag;
      setItem(TAGS_VIEW, state.tagsViewList);
    },
    // 关闭标签页
    removeTagsView(state, payload) {
      // 关闭当前页
      if (payload.type === "index") {
        // 删除当前指定的一项标签页
        state.tagsViewList.splice(payload.index, 1);
      } else if (payload.type === "other") {
        // 删除当前位置之后的标签页
        state.tagsViewList.splice(
          payload.index + 1,
          state.tagsViewList.length - payload.index + 1
        );
        // 删除当前位置之前的标签页
        state.tagsViewList.splice(1, payload.index - 1);
      } else if (payload.type === "right") {
        // 删除当前位置之后的标签页
        state.tagsViewList.splice(
          payload.index + 1,
          state.tagsViewList.length - payload.index + 1
        );
      }
      setItem(TAGS_VIEW, state.tagsViewList);
    },
  },
  actions: {
    // 退出登录
    logout() {
      // 1. 清除当前用户的令牌
      // this.commit('user/setToken', '')
      // 2. 清除当前用户的信息
      // this.commit('user/setUserInfo', {})
      // 3. 清除本地缓存
      removeAllItem();
      // 4. 清除相关权限的菜单信息
      // resetRouter();
      // 5. 跳转到登录页
      router.push("/login");
    },
  },
  modules: {},
});
