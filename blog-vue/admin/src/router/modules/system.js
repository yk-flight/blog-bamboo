import Main from "@/layout/Main.vue";

export default {
  path: "/system",
  component: Main,
  redirect: "/system/website",
  name: "system",
  meta: {
    title: "系统管理",
    icon: "system",
  },
  children: [
    {
      path: "/system/website",
      name: "website",
      component: () => import("@/views/system/Website.vue"),
      meta: {
        title: "网站管理",
        icon: "computer",
      },
    },
    {
      path: "/system/pages",
      name: "pages",
      component: () => import("@/views/system/Pages.vue"),
      meta: {
        title: "页面管理",
        icon: "documentation",
      },
    },
    {
      path: "/system/links",
      name: "links",
      component: () => import("@/views/system/Links.vue"),
      meta: {
        title: "友链管理",
        icon: "personnel",
      },
    },
    {
      path: "/system/about",
      name: "about",
      component: () => import("@/views/system/About.vue"),
      meta: {
        title: "关于我",
        icon: "edit",
      },
    },
  ],
};
