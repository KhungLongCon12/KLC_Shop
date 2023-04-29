import axios from "axios";

axios.interceptors.request.use((config) => {
  config.headers = {
    "Access-Control-Allow-Origin": "*",
    "Content-Type": "application/json",
  };
  return config;
});
