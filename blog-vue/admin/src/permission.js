import router from "@/router";
import store from "@/store";
import NProgress from "nprogress";

// 调整进度条的速度
NProgress.configure({ easing: "ease", speed: 500 });

// 白名单 => 用户未登录也可以进入的页面
const whiteList = ["/login", "/404"];

// ======================= 路由导航守卫 =======================
// to：当前位置，from：将要跳转的位置
router.beforeEach(async (to, from, next) => {
  // 开启页面进度条
  NProgress.start();

  // 如果本地已经缓存token
  if (store.getters.token) {
    // 1. 如果用户已登录，则不允许进入 login
    if (to.path === "/login") {
      // 跳回首页
      next("/");
    } else {
      // 判断用户资料是否存在，如果不存在则获取用户信息
      if (!store.getters.hasUserInfo) {
        // 获取当前登录用户的设备
        store.dispatch("user/getUserAgent");

        const { permission } = await store.dispatch("user/getUserInfo");
        // 处理用户权限，筛选出需要添加的路由
        const filterRoutes = await store.dispatch(
          "permission/filterRoutes",
          permission
        );

        // 循环添加动态路由
        filterRoutes.forEach((item) => {
          router.addRoute(item);
        });

        // 动态路由添加完成后，需要进行一次主动跳转
        return next(to.path);
      }
      next();
    }
  } else {
    // 放行登录的请求和验证码请求
    if (to.path === "/login" || to.path === "/kaptcha") {
      next();
    } else {
      // 否则在没有登录之前的一切路由都重定向到登录页面
      next("/login");
    }
  }
});

router.afterEach((to, from) => {
  // 关闭进度条
  NProgress.done();
});
