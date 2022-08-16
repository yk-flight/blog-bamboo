import Main from "@/layout/Main.vue";

export default {
  path: "/article",
  component: Main,
  redirect: "/article/create-article",
  name: "article",
  meta: {
    title: "文章管理",
    icon: "article",
  },
  children: [
    {
      path: "/article/create-article",
      name: "发布文章",
      component: () => import("@/views/article/CreateArticle.vue"),
      meta: {
        title: "发布文章",
        icon: "article-create",
      },
    },
    {
      path: "/article/categorys",
      name: "分类管理",
      component: () => import("@/views/article/Category"),
      meta: {
        title: "分类管理",
        icon: "category",
      },
    },
    {
      path: "/article/tags",
      name: "标签管理",
      component: () => import("@/views/article/Tags"),
      meta: {
        title: "标签管理",
        icon: "tags",
      },
    },
  ],
};
