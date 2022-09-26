import request from "@/utils/request";

/**
 * 获取关于我数据
 *
 * @returns
 */
export const getAboutInfo = () => {
  return request({
    url: "/about/getAboutInfo",
    method: "GET",
  });
};

/**
 * 更细关于我数据
 *
 * @param {*} data
 * @returns
 */
export const updateAboutInfo = (data) => {
  return request({
    url: "/about/updateAboutInfo",
    method: "PUT",
    data: data,
  });
};
