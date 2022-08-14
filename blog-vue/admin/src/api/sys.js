import request from "@/utils/request";

/**
 *  登录接口
 *
 * @param {*} data promise
 * @returns
 */
export const login = (data) => {
  return request({
    url: "/login",
    method: "POST",
    data,
  });
};

/**
 * 获取用户信息
 *
 * return Promise
 */
export const getUserInfo = () => {
  return request({
    url: "/admin/getUserById",
    method: "GET",
  });
};
