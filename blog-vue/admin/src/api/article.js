import request from "@/utils/request";

/**
 * 获取所有文章分类(分页)
 *
 * @param {*} data
 */
export const getCategoryByPage = (data) => {
  return request({
    url: "/admin/getCategoryByPage",
    method: "GET",
    params: data,
  });
};

/**
 * 获取所有分类
 *
 * @returns
 */
export const getAllCategory = () => {
  return request({
    url: "/category/getAllCategory",
    method: "GET",
  });
};

/**
 * 新增文章分类
 *
 * @param {*} data
 * @returns
 */
export const insertCategory = (data) => {
  return request({
    url: "/admin/insertCategory",
    method: "POST",
    data,
  });
};

/**
 * 更新文章分类
 *
 * @param {*} data
 * @returns
 */
export const updateCategory = (data) => {
  return request({
    url: "/admin/updateCategory",
    method: "PUT",
    data,
  });
};

/**
 * 删除文章分类
 */
export const deleteCategory = (id) => {
  return request({
    url: `/admin/deleteCategory/${id}`,
    method: "DELETE",
  });
};

/**
 * 批量删除文章分类
 */
export const deleteCategoryBatchIds = (ids) => {
  return request({
    url: `/admin/deleteCategoryBatchIds/${ids}`,
    method: "DELETE",
  });
};

/**
 * 获取所有标签(分页)
 *
 * @returns
 */
export const getTagsList = (params) => {
  return request({
    url: "/tags/getTagsList",
    method: "GET",
    params: params,
  });
};

/**
 * 获取所有标签
 *
 * @returns
 */
export const getAllTags = () => {
  return request({
    url: "/tags/getAllTags",
    method: "GET",
  });
};

/**
 * 添加标签
 *
 * @param {*} data
 * @returns
 */
export const insertTags = (data) => {
  return request({
    url: "/tags/insertTags",
    method: "POST",
    data: data,
  });
};

/**
 * 更新标签
 *
 * @param {*} data
 * @returns
 */
export const updateTags = (data) => {
  return request({
    url: "/tags/updateTags",
    method: "POST",
    data: data,
  });
};

/**
 * 删除标签
 *
 * @param {*} id
 * @returns
 */
export const deleteTags = (id) => {
  return request({
    url: `/tags/deleteTags/${id}`,
    method: "DELETE",
  });
};

/**
 * 批量删除标签
 *
 * @param {*} ids
 * @returns
 */
export const deleteTagsBatchIds = (ids) => {
  return request({
    url: `/tags/deleteTagsBatchIds/${ids}`,
    method: "DELETE",
  });
};

/**
 * 保存文章
 *
 * @param {*} data
 * @returns
 */
export const saveArticle = (data) => {
  return request({
    url: "/article/save",
    method: "POST",
    data: data,
  });
};

/**
 * 获取文章列表
 *
 * @param {*} data
 * @returns
 */
export const getArticleList = (params) => {
  return request({
    url: "/article/getArticleList",
    method: "GET",
    params: params,
  });
};

/**
 * 更新文章置顶状态
 *
 * @param {*} id
 * @returns
 */
export const updateArticleTop = (id) => {
  return request({
    url: `/article/updateArticleTop/${id}`,
    method: "GET",
  });
};

/**
 * 更新文章评论状态
 *
 * @param {*} id
 * @returns
 */
export const updateArticleComment = (id) => {
  return request({
    url: `/article/updateArticleComment/${id}`,
    method: "GET",
  });
};

/**
 * 将文章移动到回收站
 *
 * @param {*} id
 * @returns
 */
export const removeArticle = (id) => {
  return request({
    url: `/article/removeArticle/${id}`,
    method: "GET",
  });
};

/**
 * 将批量文章移动到回收站
 *
 * @param {*} ids
 * @returns
 */
export const removeArticleBatchIds = (ids) => {
  return request({
    url: `/article/removeArticleBatchIds/${ids}`,
    method: "GET",
  });
};

/**
 * 从回收站中恢复指定文章
 *
 * @param {*} id
 * @returns
 */
export const recoverArticle = (id) => {
  return request({
    url: `article/recoverArticle/${id}`,
  });
};

/**
 * 批量恢复删除的文章
 *
 * @param {*} ids
 * @returns
 */
export const recoverArticleBatchIds = (ids) => {
  return request({
    url: `/article/recoverArticleBatchIds/${ids}`,
    method: "GET",
  });
};

/**
 * 从回收站中删除指定文章
 *
 * @param {*} id
 * @returns
 */
export const deleteArticle = (id) => {
  return request({
    url: `/article/deleteArticle/${id}`,
    method: "DELETE",
  });
};

/**
 * 批量删除回收站中的文章
 *
 * @param {*} ids
 * @returns
 */
export const deleteArticleBatchIds = (ids) => {
  return request({
    url: `/article/deleteArticleBatchIds/${ids}`,
    method: "DELETE",
  });
};

/**
 * 通过文章ID获取指定文章对象
 *
 * @param {*} id
 * @returns
 */
export const getArticleById = (id) => {
  return request({
    url: `/article/getArticleById/${id}`,
    method: "GET",
  });
};
