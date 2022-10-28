import request from "@/utils/request";

/**
 * 获取网站信息
 *
 * @returns
 */
export const getWebsiteInfo = () => {
  return request({
    url: "/api/website/getWebsiteInfo",
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
    url: "/api/website/updateWebsiteInfo",
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
    url: "/api/social/getSocialInfo",
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
    url: "/api/social/updateSocialInfo",
    method: "POST",
    data: data,
  });
};

/**
 * 获取网站其他信息
 *
 * @returns
 */
export const getWebsiteOtherInfo = () => {
  return request({
    url: "/api/website/getOtherInfo",
    method: "GET",
  });
};

/**
 * 更新网站其他信息
 *
 * @param {*} data
 */
export const updateWebsiteOtherInfo = (data) => {
  return request({
    url: "/api/website/updateOtherInfo",
    method: "PUT",
    data: data,
  });
};
