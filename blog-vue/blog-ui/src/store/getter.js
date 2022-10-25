// 快捷访问
const getters = {
  // 侧边栏
  navBarList: (state) => state.navbar.navBarList,
  // 博客社交信息
  social: (state) => state.config.social,
  // 博客网站基本配置信息
  website: (state) => state.config.website,
  // 网站其他配置信息
  websiteOther: (state) => state.config.websiteOther,
};

export default getters;
