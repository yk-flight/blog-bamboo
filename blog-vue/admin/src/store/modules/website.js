import { AVATAR } from "@/constant";
import { setItem } from "@/utils/storage";
import { getWebsiteOtherInfo } from "@/api/website";

export default {
  // 表示模块为单独的模块
  namespaced: true,
  state: () => ({
    // 游客用户头像
    avatar: "",
  }),
  mutations: {
    setAvatar(state, avatar) {
      state.avatar = avatar;
      setItem(AVATAR, avatar);
    },
  },
  actions: {
    // 获取网站信息动作
    async getOtherInfo() {
      // 获取到服务端的返回数据
      const res = await getWebsiteOtherInfo();
      this.commit("website/setAvatar", res.avatar);
    },
  },
};
