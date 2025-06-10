import { api } from "@/lib/api";

interface LoginCredentials {
    email: string;
    password: string;
}

export async function login(credentials: LoginCredentials) {
    try {
        const response = await api.post("/auth/login", credentials);
        return response.data;
    } catch (error: any) {
        if (error.response?.data?.detail?.code === "invalid_credentials") {
            throw new Error("Email ou senha inválidos");
        }
        throw error;
    }
}

export async function logout() {
    await api.post("/auth/logout");
}

export async function refreshToken() {
    await api.post("/auth/refresh");
}
