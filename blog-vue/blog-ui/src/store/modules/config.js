import { SOCIAL, WEBISTE, WEBISTE_OTHER } from "../../constant/index";
import { getItem, setItem } from "@/utils/storage";
import { getBlogConfigInfo } from "../../api/blog";

export default {
  namespaced: true,
  state: () => ({
    // 网站信息
    website: getItem(WEBISTE) || {},
    // 社交信息
    social: getItem(SOCIAL) || {},
    // 网站其他信息
    websiteOther: getItem(WEBISTE_OTHER) || {},
  }),
  mutations: {
    // 设置博客社交信息
    setSocial(state, social) {
      state.social = social;
      setItem(SOCIAL, social);
    },
    // 设置网站基本信息
    setWebsite(state, website) {
      state.website = website;
      setItem(WEBISTE, website);
    },
    // 设置网站其他信息
    setWebsiteOther(state, websiteOther) {
      state.websiteOther = websiteOther;
      setItem(WEBISTE_OTHER, websiteOther);
    },
  },
  actions: {
    // 获取顶部导航栏动作
    async getBlogConfig() {
      // 从服务器中获取数据
      const res = await getBlogConfigInfo();
      let result = res.data;
      // 社交对象
      let social = result.socialVO;
      // 社交链接
      social.gitee = result.gitee;
      social.github = result.github;
      social.csdn = result.csdn;
      social.leetcode = result.leetcode;
      this.commit("config/setSocial", social);

      // 网站基本信息
      let website = result.websiteVO;
      // 文章、标签、分类数量
      website.articleCount = result.articleCount;
      website.tagsCount = result.tagsCount;
      website.categoryCount = result.categoryCount;
      // 网站总访问量
      website.visitCount = result.visitCount;
      this.commit("config/setWebsite", website);

      // 网站其他信息
      let websiteOther = result.websiteOtherVO;
      this.commit("config/setWebsiteOther", websiteOther);
      return res;
    },
  },
};
