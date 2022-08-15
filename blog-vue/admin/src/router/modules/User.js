import Layout from "@/layout";

export default {
  path: "/user",
  component: Layout,
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
