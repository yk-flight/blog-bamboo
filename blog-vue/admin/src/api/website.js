import request from "@/utils/request";

/**
 * 获取网站信息
 *
 * @returns
 */
export const getWebsiteInfo = () => {
  return request({
    url: "/website/getWebsiteInfo",
    method: "GET",
  });
};

/**
 * 更新网站信息
 *
 * @param {*} data
 * @returns
 */
export const updateWebsiteInfo = (data) => {
  return request({
    url: "/website/updateWebsiteInfo",
    method: "POST",
    data: data,
  });
};
