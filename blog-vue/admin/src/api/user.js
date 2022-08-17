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

/**
 * 获取用户可以访问的页面
 *
 * @returns 用户可以访问的页面集合
 */
export const getAccessPath = () => {
  return request({
    url: "/admin/getAccessPath",
    method: "GET",
  });
};

/**
 * 用户更新密码操作
 *
 * @param {*} data 密码表单
 * @returns
 */
export const updatePassword = (data) => {
  return request({
    url: "/admin/updatePassword",
    method: "PUT",
    data,
  });
};
