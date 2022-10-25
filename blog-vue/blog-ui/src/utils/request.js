import axios from "axios";
import store from "@/store";

const service = axios.create({
  baseURL: process.env.VUE_APP_BASE_API,
  // 超时时间 => 15s
  timeout: 15 * 1000,
});

export default service;
