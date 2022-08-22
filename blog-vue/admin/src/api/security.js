import request from "@/utils/request";

export const getAllMenus = (data) => {
  return request({
    url: "/admin/getAllMenus",
    method: "POST",
    data,
  });
};

export const getAllRoles = () => {
  return request({
    url: "/admin/getAllRoles",
    method: "GET",
  });
};
