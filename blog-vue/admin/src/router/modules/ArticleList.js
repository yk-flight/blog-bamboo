import Layout from "@/layout";

export default {
  path: "/article",
  component: Layout,
  redirect: "/article/create-article",
  // 判断是否具有该菜单的权限标识
  name: "article",
  meta: {
    title: "文章管理",
    icon: "article",
  },
  children: [
    {
      path: "/article/article-list",
      name: "文章列表",
      component: () => import("@/views/article/ArticleList.vue"),
      meta: {
        title: "文章列表",
        icon: "article-ranking",
      },
    },
  ],
};
