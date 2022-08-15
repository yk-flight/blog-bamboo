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
    {
      path: "/security/interface",
      name: "接口管理 ",
      component: () => import("@/views/security/Interface.vue"),
      meta: {
        title: "接口管理",
        icon: "swagger",
      },
    },
    {
      path: "/security/roles",
      name: "角色管理 ",
      component: () => import("@/views/security/Roles.vue"),
      meta: {
        title: "角色管理",
        icon: "role",
      },
    },
  ],
};
