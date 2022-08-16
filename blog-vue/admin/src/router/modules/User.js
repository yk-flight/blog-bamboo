import Main from "@/layout/Main.vue";

export default {
  path: "/user",
  component: Main,
  redirect: "/user/userList",
  name: "userManage",
  meta: {
    title: "用户管理",
    icon: "personnel-manage",
  },
  children: [
    {
      path: "/user/userList",
      name: "用户列表",
      component: () => import("@/views/user/UserList.vue"),
      meta: {
        title: "用户列表",
        icon: "peoples",
      },
    },
  ],
};
