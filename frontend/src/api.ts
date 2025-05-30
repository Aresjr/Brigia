import axios from 'axios';

const api = axios.create({
    baseURL: import.meta.env.BACKEND_PORT || 'http://localhost:8008'
});

export const login = async (email: string, password: string) => {
    try {
        const response = await api.post('/auth/login', { email, password });
        sessionStorage.setItem('token', response.data.token);
        return response.data;
    } catch (error) {
        throw error.response?.data || error;
    }
}