import request from "@/utils/request";

/**
 * 获取博客顶部导航栏信息
 *
 * @returns
 */
export const getNavBarInfo = () => {
  return request({
    url: "/api/getNavBarInfo",
    method: "GET",
  });
};

/**
 * 获取博客配置信息
 *
 * @returns
 */
export const getBlogConfigInfo = () => {
  return request({
    url: "/api/getBlogConfigInfo",
    method: "GET",
  });
};

/**
 * 获取文章归档信息
 *
 * @returns
 */
export const getArchiveList = (params) => {
  return request({
    url: "/api/getArchiveList",
    method: "GET",
    params: params,
  });
};

/**
 * 获取文章分类信息
 *
 * @param {*} params
 * @returns
 */
export const getCategoryList = (params) => {
  return request({
    url: "/api/getCategoryList",
    method: "GET",
    params: params,
  });
};

/**
 * 获取关于我信息
 *
 * @returns
 */
export const getAboutInfo = () => {
  return request({
    url: "/api/getAboutInfo",
    method: "GET",
  });
};

/**
 * 获取友链列表
 *
 * @returns
 */
export const getLinkList = () => {
  return request({
    url: "/api/getLinkList",
    method: "GET",
  });
};

/**
 * 获取标签列表
 *
 * @returns
 */
export const getTagsList = () => {
  return request({
    url: "/api/getTagsList",
    method: "GET",
  });
};

/**
 * 获取留言列表
 *
 * @returns
 */
export const getMessageList = () => {
  return request({
    url: "/api/getMessageList",
    method: "GET",
  });
};

/**
 * 获取文章列表
 *
 * @returns
 */
export const getArticleList = (params) => {
  return request({
    url: "/api/getArticleList",
    method: "GET",
    params: params,
  });
};

/**
 * 根据文章ID获取文章内容
 *
 * @param {*} id
 * @returns
 */
export const getArticleById = (id) => {
  return request({
    url: `/api/getArticleById/${id}`,
    method: "GET",
  });
};

/**
 * 获取相关推荐文章
 *
 * @returns
 */
export const getRecommend = () => {
  return request({
    url: "/api/getRecommend",
    method: "GET",
  });
};

/**
 * 获取当前文章的评论列表
 *
 * @param {*} params
 * @returns
 */
export const listComment = (params) => {
  return request({
    url: "/api/listComment",
    method: "GET",
    params: params,
  });
};

/**
 * 用户添加评论
 *
 * @param {*} data
 * @returns
 */
export const saveComment = (data) => {
  return request({
    url: "/api/saveComment",
    method: "POST",
    data: data,
  });
};

/**
 * 用户进行留言
 *
 * @param {*} data
 * @returns
 */
export const saveMessage = (data) => {
  return request({
    url: "/api/saveMessage",
    method: "POST",
    data: data,
  });
};

/**
 * 获取分类、标签对应的文章
 *
 * @param {*} params
 * @returns
 */
export const listArticle = (params) => {
  return request({
    url: "/api/listArticle",
    method: "GET",
    params: params,
  });
};

/**
 * 获取所有相册
 *
 * @returns
 */
export const listPhotos = () => {
  return request({
    url: "/api/listPhotos",
    method: "GET",
  });
};

/**
 * 获取相册对应的照片
 *
 * @returns
 */
export const listPhotoById = (id) => {
  return request({
    url: `/api/listPhotoById/${id}`,
    method: "GET",
  });
};
