import request from "@/utils/request";

/**
 * 获取所有文章分类
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
 * 获取所有标签
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
