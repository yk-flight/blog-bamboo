import request from "@/utils/request";

/**
 * 获取所有文件用途
 */
export const getFileUse = () => {
  return request({
    url: "/api/files/getFileUse",
    method: "GET",
  });
};

/**
 * 根据上传的文件路径删除文件
 *
 * @param {*} path
 * @returns
 */
export const deleteFileByPath = (path) => {
  return request({
    url: "/api/upload/deleteFileByPath/",
    method: "GET",
    params: path,
  });
};
