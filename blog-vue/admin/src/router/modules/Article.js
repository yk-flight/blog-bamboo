import Layout from "@/layout";

export default {
  path: "/article",
  component: Layout,
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
    // {
    //   path: "/article/:id",
    //   name: "articleDetail",
    //   component: () => import("@/views/article-detail/index"),
    //   meta: {
    //     title: "articleDetail",
    //   },
    // },
  ],
};
