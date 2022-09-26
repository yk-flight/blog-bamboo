import Main from "@/layout/Main.vue";

export default {
  path: "/information",
  component: Main,
  redirect: "/information/comment",
  name: "information",
  meta: {
    title: "消息管理",
    icon: "email",
  },
  children: [
    {
      path: "/information/comment",
      name: "comment",
      component: () => import("@/views/information/Comment.vue"),
      meta: {
        title: "评论管理",
        icon: "comments",
      },
    },
    {
      path: "/information/message",
      name: "message",
      component: () => import("@/views/information/Message.vue"),
      meta: {
        title: "留言管理",
        icon: "message",
      },
    },
  ],
};
