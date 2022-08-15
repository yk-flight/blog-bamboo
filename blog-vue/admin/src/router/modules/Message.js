import Layout from "@/layout";

export default {
  path: "/information",
  component: Layout,
  redirect: "/information/comment",
  name: "information",
  meta: {
    title: "消息管理",
    icon: "email",
  },
  children: [
    {
      path: "/information/comment",
      name: "评论管理",
      component: () => import("@/views/information/Comment.vue"),
      meta: {
        title: "评论管理",
        icon: "comments",
      },
    },
    {
      path: "/information/leave",
      name: "留言管理",
      component: () => import("@/views/information/Leave.vue"),
      meta: {
        title: "留言管理",
        icon: "message",
      },
    },
  ],
};
