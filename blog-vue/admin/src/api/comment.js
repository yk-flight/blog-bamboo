import request from "@/utils/request";

/**
 * 获取所有评论（分页）
 *
 * @param {*} params
 * @returns
 */
export const getCommentList = (params) => {
  return request({
    url: "/comment/getCommentList",
    method: "GET",
    params: params,
  });
};

/**
 * 根据分页状态获取所有评论（分页）
 *
 * @param {*} params
 * @returns
 */
export const getAllowCommentList = (params) => {
  return request({
    url: "/comment/getAllowCommentList",
    method: "GET",
    params: params,
  });
};

/**
 * 删除指定评论
 *
 * @param {*} id
 * @returns
 */
export const deleteCommentById = (id) => {
  return request({
    url: `/comment/deleteCommentById/${id}`,
    method: "DELETE",
  });
};

/**
 * 批量删除评论
 *
 * @param {*} ids
 * @returns
 */
export const deleteCommentBatchIds = (ids) => {
  return request({
    url: `/comment/deleteCommentBatchIds/${ids}`,
    method: "DELETE",
  });
};

/**
 * 通过审核评论
 *
 * @param {*} id
 * @returns
 */
export const passCommentById = (id) => {
  return request({
    url: `/comment/passCommentById/${id}`,
    method: "GET",
  });
};

/**
 * 批量审核通过评论
 *
 * @param {*} ids
 * @returns
 */
export const passCommentBatchIds = (ids) => {
  return request({
    url: `/comment/passCommentBatchIds/${ids}`,
    method: "GET",
  });
};

/**
 * 回复评论
 *
 * @param {*} data
 * @returns
 */
export const addComment = (data) => {
  return request({
    url: "/comment/addComment",
    method: "POST",
    data: data,
  });
};
