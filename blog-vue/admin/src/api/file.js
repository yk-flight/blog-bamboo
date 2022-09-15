import request from "@/utils/request";

/**
 * 获取所有文件用途
 */
export const getFileUse = () => {
  return request({
    url: "/files/getFileUse",
    method: "GET",
  });
};
