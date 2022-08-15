import Layout from "@/layout";

export default {
  path: "/security",
  component: Layout,
  redirect: "/security/menus",
  name: "security",
  meta: {
    title: "权限管理",
    icon: "security",
  },
  children: [
    {
      path: "/security/menus",
      name: "菜单管理",
      component: () => import("@/views/security/Menus.vue"),
      meta: {
        title: "菜单管理",
        icon: "menu",
      },
    },
    // {
    //   path: "/information/leave",
    //   name: "留言管理",
    //   component: () => import("@/views/information/Leave.vue"),
    //   meta: {
    //     title: "留言管理",
    //     icon: "message",
    //   },
    // },
  ],
};
