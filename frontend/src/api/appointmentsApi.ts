import api from './index';

const url = '/appointments';

export const getAppointments = async () => {
    const res = await api.get(url);
    return res.data;
};

export const createAppointment = async (appointmentData: any) => {
    const res = await api.post(url, appointmentData);
    return res.data;
}

export const updateAppointment = async (id: string | number, medicalPlanData: any) => {
    const res = await api.put(`${url}/${id}`, medicalPlanData);
    return res.data;
};

export const deleteAppointment = async (id: string | number) => {
    const res = await api.delete(`${url}/${id}`);
    return res.data;
}