import Main from "@/layout/Main.vue";

export default {
  path: "/log",
  component: Main,
  redirect: "/log/operation",
  name: "logManage",
  meta: {
    title: "日志管理",
    icon: "server",
  },
  children: [
    {
      path: "/log/operation",
      name: "操作日志",
      component: () => import("@/views/log/Operation.vue"),
      meta: {
        title: "操作日志",
        icon: "access",
      },
    },
  ],
};
