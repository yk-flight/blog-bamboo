import { getRequest } from "./api";

// 初始化菜单
export const initMenu = (router, store) => {
  // 当前菜单已经存在
  if (store.state.routes.length > 0) {
    return;
  }

  getRequest("/system/menu").then((data) => {
    if (data) {
      // 格式化后的Router
      let fmtRoutes = formatRoutes(data);
      // 格式化好的数据添加到路由
      router.addRoutes(fmtRoutes);

      // 将路由数据存储到vuex中
      store.commit("initRoutes", fmtRoutes);
    }
  });
};

// 格式化路由
export const formatRoutes = (routes) => {
  let fmtRoutes = [];
  routes.forEach((router) => {
    // 从router中截取出以下数据
    let { path, component, name, icon, children } = router;

    // 如果存在 children 并且是数组形式
    if (children && children instanceof Array) {
      // 递归
      children = formatRoutes(children);
    }

    let fmtRouter = {
      path: path,
      name: name,
      icon: icon,
      children: children,
      component(resolve) {
        require(["@/views/" + component + ".vue"], resolve);
      },
    };
    // 将格式化好路由对象放到路由数组中
    fmtRoutes.push(fmtRouter);
    return fmtRoutes;
  });
};
