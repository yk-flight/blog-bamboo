import request from "@/utils/request";

/**
 * 获取所有页面信息
 *
 * @returns
 */
export const getPagesList = () => {
  return request({
    url: "/api/pages/getPagesList",
    method: "GET",
  });
};

/**
 * 更新页面信息
 *
 * @param {*} data
 * @returns
 */
export const updatePageInfo = (data) => {
  return request({
    url: "/api/pages/updatePageInfo",
    method: "PUT",
    data: data,
  });
};

/**
 * 新建页面
 *
 * @param {*} data
 * @returns
 */
export const addPages = (data) => {
  return request({
    url: "/api/pages/addPages",
    method: "POST",
    data: data,
  });
};

/**
 * 删除指定页面
 *
 * @param {*} id
 * @returns
 */
export const deletePage = (id) => {
  return request({
    url: `/api/pages/deletePageById/${id}`,
    method: "DELETE",
  });
};
