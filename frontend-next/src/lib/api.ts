import axios from 'axios';

let isRefreshing = false;
let failedQueue: Array<{ resolve: (value?: unknown) => void; reject: (reason?: any) => void }> = [];

export const api = axios.create({
    baseURL: process.env.NEXT_PUBLIC_BACKEND_URL || 'http://localhost:8008',
    withCredentials: true
});

const processQueue = (error: any | null = null) => {
    failedQueue.forEach((prom) => {
        if (error) {
            prom.reject(error);
        } else {
            prom.resolve();
        }
    });
    failedQueue = [];
};

api.interceptors.response.use(
    (response) => response,
    async (error) => {
        const originalRequest = error.config;

        if (error.response?.status === 401 &&
            !originalRequest._retry &&
            !originalRequest.url.includes("/auth/refresh")
        ) {
            if (isRefreshing) {
                try {
                    await new Promise((resolve, reject) => {
                        failedQueue.push({ resolve, reject });
                    });
                    return api(originalRequest);
                } catch (err) {
                    window.location.href = '/login';
                    return Promise.reject(err);
                }
            }

            isRefreshing = true;
            originalRequest._retry = true;

            try {
                await api.post("/auth/refresh");
                processQueue();
                return api(originalRequest);
            } catch (refreshError) {
                processQueue(refreshError);
                window.location.href = '/login';
                return Promise.reject(refreshError);
            } finally {
                isRefreshing = false;
            }
        }

        return Promise.reject(error);
    }
);
