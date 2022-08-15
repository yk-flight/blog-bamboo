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
