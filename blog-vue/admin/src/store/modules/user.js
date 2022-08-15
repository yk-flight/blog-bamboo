import router from "@/router";
import { TOKEN } from "@/constant";
import { setTimeStamp } from "@/utils/auth";
import { setItem, getItem, removeAllItem } from "@/utils/storage";
import { login, getUserInfo, getUserAgent } from "../../api/sys";

export default {
  // 表示模块为单独的模块
  namespaced: true,
  state: () => ({
    // token
    token: getItem(TOKEN) || "",
    // 用户登录信息
    userInfo: {},
    // 用户登录设备
    userAgent: "",
  }),
  mutations: {
    setToken(state, token) {
      state.token = token;
      setItem(TOKEN, token);
    },
    setUserInfo(state, userInfo) {
      state.userInfo = userInfo;
    },
    setUserAgent(state, userAgent) {
      state.userAgent = userAgent;
    },
  },
  actions: {
    // 登录请求动作
    login(context, userInfo) {
      // 从用户信息中得到用户名和密码
      const { username, password, code } = userInfo;
      return new Promise((resolve, reject) => {
        login({
          username,
          password: password,
          code: code,
        })
          .then((data) => {
            // 将 token 进行存储
            this.commit("user/setToken", data.token);
            // 保存登录时间
            // setTimeStamp();
            resolve();
          })
          // 如果出现错误
          .catch((error) => {
            reject(error);
          });
      });
    },

    // 获取用户信息
    async getUserInfo(context) {
      // 获取到服务端的返回数据
      const res = await getUserInfo();
      this.commit("user/setUserInfo", res);
      return res;
    },

    // 获取用户登录设备
    async getUserAgent(context) {
      // 获取服务器端返回的数据
      const res = await getUserAgent();
      this.commit("user/setUserAgent", res);
      return res;
    },

    // 退出登录
    logout() {
      // 1. 清除当前用户的令牌
      this.commit("user/setToken", "");
      // 2. 清除当前用户的信息
      this.commit("user/setUserInfo", {});
      this.commit("user/setUserAgent", "");
      // 3. 清除本地缓存
      removeAllItem();
      // 4. 清除相关权限的菜单信息
      // resetRouter();
      // 5. 跳转到登录页
      router.push("/login");
      // 刷新当前页面
      router.go(0);
    },
  },
};
