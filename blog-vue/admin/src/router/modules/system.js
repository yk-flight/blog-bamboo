import Layout from "@/layout";

export default {
  path: "/system",
  component: Layout,
  redirect: "/system/website",
  name: "system",
  meta: {
    title: "系统管理",
    icon: "system",
  },
  children: [
    {
      path: "/system/website",
      name: "网站管理",
      component: () => import("@/views/system/Website.vue"),
      meta: {
        title: "网站管理",
        icon: "computer",
      },
    },
    {
      path: "/system/pages",
      name: "页面管理",
      component: () => import("@/views/system/Pages.vue"),
      meta: {
        title: "页面管理",
        icon: "documentation",
      },
    },
    {
      path: "/system/links",
      name: "友链管理",
      component: () => import("@/views/system/Links.vue"),
      meta: {
        title: "友链管理",
        icon: "personnel",
      },
    },
    {
      path: "/system/about",
      name: "关于我",
      component: () => import("@/views/system/About.vue"),
      meta: {
        title: "关于我",
        icon: "edit",
      },
    },
  ],
};
