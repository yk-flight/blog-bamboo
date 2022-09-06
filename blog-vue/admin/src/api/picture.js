import request from "@/utils/request";

/**
 * 获取文件列表
 *
 * @param {*} params
 * @returns
 */
export const getFilesList = (params) => {
  return request({
    url: "/files/getFilesList",
    method: "GET",
    params: params,
  });
};

export const upload = (data) => {
  return request({
    url: "/upload/",
    method: "POST",
    data: data,
  });
};
