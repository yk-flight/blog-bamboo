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
      name: "articleCreate",
      component: () => import("@/views/article/CreateArticle.vue"),
      meta: {
        title: "发布文章",
        icon: "article-create",
      },
    },
    {
      path: "/article/categorys",
      name: "category",
      component: () => import("@/views/article/Category"),
      meta: {
        title: "分类管理",
        icon: "category",
      },
    },
    {
      path: "/article/tags",
      name: "tags",
      component: () => import("@/views/article/Tags"),
      meta: {
        title: "标签管理",
        icon: "tags",
      },
    },
    {
      path: "/article/editor/:id",
      name: "articleEditor",
      component: () => import("@/views/article/components/ArticleEditor"),
      meta: {
        title: "文章编辑",
      },
    },
  ],
};
