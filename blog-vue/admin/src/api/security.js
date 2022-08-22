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

export const insertRole = (data) => {
  return request({
    url: "/admin/insertRole",
    method: "POST",
    data,
  });
};

export const updateRole = (data) => {
  return request({
    url: "/admin/updateRole",
    method: "PUT",
    data,
  });
};

export const deleteRole = (id) => {
  return request({
    url: `/admin/deleteRole/${id}`,
    method: "DELETE",
  });
};
