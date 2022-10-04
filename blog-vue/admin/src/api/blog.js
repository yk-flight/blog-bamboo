import request from "@/utils/request";

/**
 * 获取博客仪表盘信息
 *
 * @returns
 */
export const getBlogInfo = () => {
  return request({
    url: "/blog/getBlogInfo",
    method: "GET",
  });
};

/**
 * 获取本周访问量信息
 *
 * @returns
 */
export const getWeekViewData = () => {
  return request({
    url: "/week-view/getWeekViewData",
    method: "GET",
  });
};
