import axios from 'axios';
import {logout} from "@/api/auth.ts";
import {useNavigate} from "react-router-dom";

let isRefreshing = false;
let failedQueue: Array<{ resolve: (value?: unknown) => void; reject: (reason?: any) => void }> = [];

export const api = axios.create({
    baseURL: import.meta.env.VITE_BACKEND_URL || 'http://localhost:8009',
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

        if (error.response?.status === 401 &&
            !originalRequest._retry &&
            !originalRequest.url.includes("/auth/refresh") &&
            !originalRequest.url.includes("/auth/login")
        ) {
            if (isRefreshing) {
                try {
                    await new Promise((resolve, reject) => {
                        failedQueue.push({ resolve, reject });
                    });
                    return api(originalRequest);
                } catch (err) {
                    await logout();
                    await Promise.reject(err);
                    const navigate = useNavigate();
                    navigate("/login");
                }
            }

            isRefreshing = true;
            originalRequest._retry = true;

            try {
                await api.post("/auth/refresh");
                processQueue(null);
                return api(originalRequest);
            } catch (refreshError) {
                processQueue(refreshError, null);
                failedQueue = [];
                await logout();
                return Promise.reject(refreshError);
            } finally {
                isRefreshing = false;
            }
        }

        if (error.response?.status === 401 && originalRequest.url.includes("/auth/refresh")) {
            await logout();
        }

        return Promise.reject(error);
    }
);

export default api;

