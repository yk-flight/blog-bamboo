import { NAV_BAR_LIST } from "../../constant/index";
import { getItem, setItem } from "@/utils/storage";
import { getNavBarInfo } from "../../api/blog";

export default {
  namespaced: true,
  state: () => ({
    // 导航栏
    navBarList: getItem(NAV_BAR_LIST) || [],
  }),
  mutations: {
    // 设置导航栏
    setNavBarList(state, navBarList) {
      state.navBarList = navBarList;
      setItem(NAV_BAR_LIST, navBarList);
    },
  },
  actions: {
    // 获取顶部导航栏动作
    async getNavBarList() {
      // 从服务器中获取数据
      const res = await getNavBarInfo();
      this.commit("navbar/setNavBarList", res.data);
      return res;
    },
  },
};
