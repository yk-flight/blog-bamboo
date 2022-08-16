import Main from "@/layout/Main.vue";

export default {
  path: "/picture",
  component: Main,
  redirect: "/picture/pictureList",
  name: "picture",
  meta: {
    title: "图片管理",
    icon: "table",
  },
  children: [
    {
      path: "/picture/pictureList",
      name: "图片列表",
      component: () => import("@/views/picture/PictureList.vue"),
      meta: {
        title: "图片列表",
        icon: "dict",
      },
    },
  ],
};
