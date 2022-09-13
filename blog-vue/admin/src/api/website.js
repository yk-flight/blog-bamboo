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

/**
 * 获取用户社交信息是否展示
 *
 * @returns
 */
export const getSocialInfo = () => {
  return request({
    url: "/social/getSocialInfo",
    method: "GET",
  });
};

/**
 * 更新用户社交信息状态
 *
 * @param {*} data
 * @returns
 */
export const updateSocialInfo = (data) => {
  return request({
    url: "/social/updateSocialInfo",
    method: "POST",
    data: data,
  });
};
