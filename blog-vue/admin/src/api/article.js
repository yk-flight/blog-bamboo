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
  console.log(ids);
  return request({
    url: `/admin/deleteCategoryBatchIds/${ids}`,
    method: "DELETE",
  });
};
