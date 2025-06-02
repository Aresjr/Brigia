import {api, getSession} from './index';

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

export const isLogged = async (): Promise<boolean> => {
    const session = getSession();
    return !!session;
}
