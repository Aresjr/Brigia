import axios from 'axios';

let isRefreshing = false;
let failedQueue = [];

export const api = axios.create({
    baseURL: import.meta.env.VITE_BACKEND_URL || 'http://localhost:8008',
    withCredentials: true
});

const processQueue = (error: any, token: string | null = null) => {
    failedQueue.forEach((prom) => {
        if (error) {
            prom.reject(error);
        } else {
            prom.resolve(token);
        }
    });
    failedQueue = [];
};

api.interceptors.response.use(
    (response) => response,
    async (error) => {
        const originalRequest = error.config;

        if (
            error.response?.status === 401 &&
            !originalRequest._retry &&
            !originalRequest.url.includes("/auth/refresh")
        ) {
            originalRequest._retry = true;

            if (isRefreshing) {
                return new Promise((resolve, reject) => {
                    failedQueue.push({ resolve, reject });
                })
                    .then(() => api(originalRequest))
                    .catch(Promise.reject);
            }

            isRefreshing = true;

            try {
                await api.post("/auth/refresh"); // 🔁 Refresh the token
                processQueue(null);
                return api(originalRequest); // 🔁 Retry the original request
            } catch (refreshError) {
                processQueue(refreshError, null);
                return Promise.reject(refreshError);
            } finally {
                isRefreshing = false;
            }
        }

        return Promise.reject(error);
    }
);

export default api;