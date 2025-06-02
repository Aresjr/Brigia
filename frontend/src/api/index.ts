import axios from 'axios';

export const api = axios.create({
    baseURL: import.meta.env.VITE_BACKEND_URL || 'http://localhost:8008'
});

api.interceptors.request.use((config) => {
    const session = getSession();
    if (session) {
        config.headers['Authorization'] = `Bearer ${session.access_token}`;
    }
    return config;
});

export const getSession = () => {
    const session = sessionStorage.getItem('session');
    return session ? JSON.parse(session) : null;
}

export const clearSession = () => {
    sessionStorage.removeItem('session');
}

export default api;