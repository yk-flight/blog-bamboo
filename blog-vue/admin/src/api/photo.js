import request from "@/utils/request";

/**
 * 获取所有相册信息
 *
 * @returns
 */
export const listPhotoCover = (params) => {
  return request({
    url: "/api/photo/listPhotoCover",
    method: "GET",
    params: params,
  });
};

/**
 * 添加/更新相册方法
 *
 * @param {*} data
 * @returns
 */
export const save = (data) => {
  return request({
    url: "/api/photo/save",
    method: "POST",
    data: data,
  });
};

/**
 * 移动相册到回收站
 *
 * @param {*} id
 * @returns
 */
export const removePhotos = (id) => {
  return request({
    url: `/api/photo/removePhotos/${id}`,
    method: "GET",
  });
};

/**
 * 批量恢复相册
 *
 * @param {*} ids
 * @returns
 */
export const recoverPhotosBatchIds = (ids) => {
  return request({
    url: `/api/photo/recoverPhotosBatchIds/${ids}`,
    method: "GET",
  });
};

/**
 * 批量删除相册
 *
 * @param {*} ids
 * @returns
 */
export const deletePhotosBatchIds = (ids) => {
  return request({
    url: `/api/photo/deletePhotosBatchIds/${ids}`,
    method: "DELETE",
  });
};

/**
 * 获取相册对应的照片
 *
 * @param {*} id
 * @returns
 */
export const listPhotoById = (id) => {
  return request({
    url: `/api/photo/listPhotoById/${id}`,
    method: "GET",
  });
};

/**
 * 批量移动照片到回收站
 *
 * @param {*} ids
 * @returns
 */
export const deletePhotoBatchIds = (ids) => {
  return request({
    url: `/api/photo/deletePhotoBatchIds/${ids}`,
    method: "GET",
  });
};
