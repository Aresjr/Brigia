import axios from 'axios';

const api = axios.create({
    baseURL: import.meta.env.VITE_BACKEND_URL || 'http://localhost:8008'
});

export const login = async (email: string, password: string) => {
    try {
        const response = await api.post('/auth/login', { email, password });
        sessionStorage.setItem('session', JSON.stringify({
            access_token: response.data.access_token,
            user: response.data.user
        }));
        return response.data;
    } catch (error) {
        throw error.response?.data || error;
    }
}

export const getSession = () => {
    const session = sessionStorage.getItem('session');
    return session ? JSON.parse(session) : null;
}

export const clearSession = () => {
    sessionStorage.removeItem('session');
}

export const isLogged = async (): Promise<boolean> => {
    const session = getSession();
    return !!session;
}
