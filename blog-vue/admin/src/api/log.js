import request from "@/utils/request";

/**
 * 获取所有操作日志
 *
 * @returns
 */
export const getOperateLogList = (params) => {
  return request({
    url: "/api/operate-log/list",
    method: "GET",
    params: params,
  });
};

/**
 * 批量删除日志
 */
export const deleteLogBatchIds = (ids) => {
  return request({
    url: `/api/operate-log/deleteLogBatchIds/${ids}`,
    method: "DELETE",
  });
};
