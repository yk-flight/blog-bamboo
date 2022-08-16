import request from "@/utils/request";

/**
 * 获取用户信息
 *
 * return Promise
 */
export const getUserInfoById = () => {
  return request({
    url: "/admin/getUserInfoById",
    method: "GET",
  });
};

/**
 *  更新用户个人信息
 *
 * @param {*} data promise
 * @returns
 */
export const updateUserInfo = (data) => {
  return request({
    url: "/admin/updateUserInfo",
    method: "POST",
    data,
  });
};

export const getAccessPath = () => {
  return request({
    url: "/admin/getAccessPath",
    method: "GET",
  });
};
