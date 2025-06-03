import api from './index';

export const login = async (email: string, password: string) => {
    try {
        const response = await api.post('/auth/login', { email, password });
        sessionStorage.setItem('session', JSON.stringify({
            user: response.data.user,
            profile: response.data.profile
        }));
        return response.data;
    } catch (error) {
        throw error.response?.data || error;
    }
}

export const logout = async () => {
    try {
        const response = await api.post('/auth/logout');
        sessionStorage.removeItem('session');
        return response.data;
    } catch (error) {
        throw error.response?.data || error;
    }
}

export const isLogged = async (): Promise<boolean> => {
    const session = sessionStorage.getItem('session');
    return !!session;
}

export const getSession = () => {
    const session = sessionStorage.getItem('session');
    return session ? JSON.parse(session) : null;
}
