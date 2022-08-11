import Vue from "vue";
import VueRouter from "vue-router";
import NProgress from "nprogress";
import Login from "@/views/login/index";
import Layout from "@/layout/index";
import Dashboard from "@/views/dashboard/index";
import Profile from "@/views/profile/index";

Vue.use(VueRouter);

const routes = [
  {
    path: "/login",
    name: "Login",
    component: Login,
    hidden: true,
  },
  {
    path: "/",
    redirect: "/dashboard",
    component: Layout,
    children: [
      // 首页仪表盘
      {
        path: "/dashboard",
        name: "仪表盘",
        component: Dashboard,
        meta: {
          title: "仪表盘",
          icon: "dashboard",
        },
      },
      // 个人中心
      {
        path: "/profile",
        name: "个人中心",
        component: Profile,
        meta: {
          title: "个人中心",
          icon: "user",
        },
      },
    ],
  },
];

const router = new VueRouter({
  mode: "hash",
  base: process.env.BASE_URL,
  routes,
});

// 调整进度条的速度
NProgress.configure({ easing: "ease", speed: 500 });

// ======================= 路由导航守卫 =======================
// to：当前位置，from：将要跳转的位置
router.beforeEach((to, from, next) => {
  // 开启页面进度条
  NProgress.start();
  // // 如果本地中存储着token信息
  // if (window.sessionStorage.getItem("token")) {
  //   // 放行
  //   next();
  // } else {
  //   // 放行登录的请求和验证码请求
  //   if (to.path === "/login" || to.path === "/kaptcha") {
  //     next();
  //   } else {
  //     // 否则在没有登录之前的一切路由都重定向到登录页面
  //     next("/login");
  //   }
  // }
  next();
});

router.afterEach((to, from) => {
  // 关闭进度条
  NProgress.done();
});

Vue.use(VueRouter);
const VueRouterPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(to) {
  return VueRouterPush.call(this, to).catch((err) => err);
};

export default router;
