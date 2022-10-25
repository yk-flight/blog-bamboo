import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    component: (resolve) => require(["../views/home/Home.vue"], resolve),
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
      title: "文章分类",
    },
  },
  {
    path: "/archive",
    name: "Archive",
    component: () => import("../views/archive/Archive.vue"),
    meta: {
      title: "文章归档",
    },
  },
  {
    path: "/links",
    name: "Links",
    component: () => import("../views/links/Links.vue"),
    meta: {
      title: "友情链接",
    },
  },
  {
    path: "/article/:id",
    name: "Article",
    component: () => import("../views/article/Article.vue"),
  },
  {
    path: "/photo",
    name: "Photo",
    component: () => import("../views/photo/Photo.vue"),
    meta: {
      title: "精选相册",
    },
  },
  {
    path: "/message",
    name: "Message",
    component: () => import("../views/message/Message.vue"),
    meta: {
      title: "留言板",
    },
  },
  {
    path: "/tags",
    name: "Tags",
    component: () => import("../views/tags/Tags.vue"),
    meta: {
      title: "文章标签",
    },
  },
  {
    path: "/category/:id",
    name: "CategoryArticle",
    component: () => import("../views/article/ArticleList.vue"),
  },
  {
    path: "/tag/:id",
    name: "TagArticle",
    component: () => import("../views/article/ArticleList.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
