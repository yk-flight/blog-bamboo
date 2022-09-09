import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: (resolve) => require(["../views/home/Home.vue"], resolve),
    meta: {
      title: "首页",
    },
  },
  {
    path: "/about",
    name: "About",
    component: () => import("../views/about/About.vue"),
    meta: {
      title: "关于我",
    },
  },
  {
    path: "/category",
    name: "Category",
    component: () => import("../views/category/Category.vue"),
    meta: {
      title: "分类",
    },
  },
  {
    path: "/archive",
    name: "Archive",
    component: () => import("../views/archive/Archive.vue"),
    meta: {
      title: "归档",
    },
  },
];

const router = new VueRouter({
  mode: "hash",
  base: process.env.BASE_URL,
  routes,
});

export default router;
