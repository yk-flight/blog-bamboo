import Main from "@/layout/Main.vue";

export default {
  path: "/security",
  component: Main,
  redirect: "/security/menus",
  name: "security",
  meta: {
    title: "权限管理",
    icon: "security",
  },
  children: [
    {
      path: "/security/menus",
      name: "menus",
      component: () => import("@/views/security/Menus.vue"),
      meta: {
        title: "菜单管理",
        icon: "menu",
      },
    },
    {
      path: "/security/interface",
      name: "interface ",
      component: () => import("@/views/security/Interface.vue"),
      meta: {
        title: "接口管理",
        icon: "swagger",
      },
    },
    {
      path: "/security/roles",
      name: "roles ",
      component: () => import("@/views/security/Roles.vue"),
      meta: {
        title: "角色管理",
        icon: "role",
      },
    },
  ],
};
