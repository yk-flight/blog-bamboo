import axios from "axios";
// 引入message提示信息
import { Message } from "element-ui";
import router from "vue-router";

// 请求拦截器
axios.interceptors.request.use(
  (config) => {
    // 获取用户的token并判断token是否存在
    if (window.sessionStorage.getItem("token")) {
      // 如果存在token则在之后的请求中都携带token
      config.headers["Authorization"] = sessionStorage.getItem("token");
    }
    return config;
  },
  (error) => {
    console.log(error);
  }
);

// 响应拦截器
axios.interceptors.response.use(
  (result) => {
    // 成功调用了后端的接口但是业务逻辑发生错误
    if (result.status && result.status == 200) {
      // 判断是否为业务逻辑错误的情况
      if (
        result.data.code == 500 ||
        result.data.code == 401 ||
        result.data.status == 403
      ) {
        Message.error({ message: result.data.message });
        // 业务逻辑错误，直接返回空
        return;
      }
      // 设置提示信息
      if (result.data.message) {
        Message.success({ message: result.data.message });
      }
      // 将后端传输的数据进行返回
      return result.data;
    }
  },
  (error) => {
    if (error.response.code == 504 || error.response.message == 404) {
      Message.error({ message: "当前访问不存在" });
    } else if (error.response.code == 403) {
      Message.error({ message: "当前用户权限不足，请联系管理员" });
    } else if (error.response.code == 401) {
      Message.error({ message: "用户未登录" });
      // 跳转到登录页面
      router.replace("/login");
    } else {
      if (error.response.data.message) {
        Message.error({ message: error.response.data.message });
      } else {
        Message.error({ message: "发生了未知错误" });
      }
    }
    return;
  }
);

let baseUrl = "";

// 传送json格式的post请求
export const postRequest = (url, params) => {
  return axios({
    method: "post",
    url: `${baseUrl}${url}`,
    data: params,
  });
};

// 传送json格式的put请求
export const putRequest = (url, params) => {
  return axios({
    method: "put",
    url: `${baseUrl}${url}`,
    data: params,
  });
};

// 传送json格式的get请求
export const getRequest = (url, params) => {
  return axios({
    method: "get",
    url: `${baseUrl}${url}`,
    data: params,
  });
};

// 传送json格式的delete请求
export const deleteRequest = (url, params) => {
  return axios({
    method: "delete",
    url: `${baseUrl}${url}`,
    data: params,
  });
};
