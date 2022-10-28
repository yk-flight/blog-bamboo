import request from "@/utils/request";

/**
 * 获取友链列表(分页)
 *
 * @param {*} params
 * @returns
 */
export const getLinksList = (params) => {
  return request({
    url: "/api/links/getLinksList",
    method: "GET",
    params: params,
  });
};

/**
 * 更新友链对象
 *
 * @param {*} data
 * @returns
 */
export const updateLinks = (data) => {
  return request({
    url: "/api/links/updateLinks",
    method: "PUT",
    data: data,
  });
};

/**
 * 新增友链对象
 *
 * @param {*} data
 * @returns
 */
export const addLinks = (data) => {
  return request({
    url: "/api/links/addLinks",
    method: "POST",
    data: data,
  });
};

/**
 * 删除指定友链
 *
 * @param {*} id
 * @returns
 */
export const deleteLinkById = (id) => {
  return request({
    url: `/api/links/deleteLinkById/${id}`,
    method: "DELETE",
  });
};
