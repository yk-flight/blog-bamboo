import request from "@/utils/request";

/**
 * 获取所有留言（分页）
 *
 * @param {*} params
 * @returns
 */
export const getMessageList = (params) => {
  return request({
    url: "/api/message/getMessageList",
    method: "GET",
    params: params,
  });
};

/**
 * 删除指定留言
 *
 * @param {*} id
 * @returns
 */
export const deleteMessageById = (id) => {
  return request({
    url: `/api/message/deleteMessageById/${id}`,
    method: "DELETE",
  });
};

/**
 * 批量删除留言
 *
 * @param {*} ids
 * @returns
 */
export const deleteMessageBatchIds = (ids) => {
  return request({
    url: `/api/message/deleteMessageBatchIds/${ids}`,
    method: "DELETE",
  });
};

/**
 * 通过审核留言
 *
 * @param {*} id
 * @returns
 */
export const passMessageById = (id) => {
  return request({
    url: `/api/message/passMessageById/${id}`,
    method: "GET",
  });
};

/**
 * 批量审核通过留言
 *
 * @param {*} ids
 * @returns
 */
export const passMessageBatchIds = (ids) => {
  return request({
    url: `/api/message/passMessageBatchIds/${ids}`,
    method: "GET",
  });
};
