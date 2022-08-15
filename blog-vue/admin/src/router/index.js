import Vue from "vue";
import VueRouter from "vue-router";
import Layout from "@/layout/index";

import article from "./modules/Article";
import articleList from "./modules/ArticleList";
import message from "./modules/Message";
import security from "./modules/Security";

Vue.use(VueRouter);

// 公开路由表
export const routes = [
  {
    path: "/login",
    name: "Login",
    component: () => import("@/views/login/Login.vue"),
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
        component: () => import("@/views/dashboard/Dashboard"),
        meta: {
          title: "仪表盘",
          icon: "dashboard",
        },
      },
      // 个人中心
      {
        path: "/profile",
        name: "个人中心",
        component: () => import("@/views/profile/Profile"),
        meta: {
          title: "个人中心",
          icon: "user",
        },
      },
    ],
  },
];

// 私有路由表
export const privateRoutes = [article, articleList, message, security];

const router = new VueRouter({
  mode: "hash",
  base: process.env.BASE_URL,
  routes: [...routes, ...privateRoutes],
});

Vue.use(VueRouter);
const VueRouterPush = VueRouter.prototype.push;
VueRouter.prototype.push = function push(to) {
  return VueRouterPush.call(this, to).catch((err) => err);
};

export default router;
