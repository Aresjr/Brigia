import api from './index';

const url = '/medical-plans';

export const getMedicalPlans = async () => {
    const res = await api.get(url);
    return res.data;
};

export const createMedicalPlan = async (medicalPlanData: any) => {
    const res = await api.post(url, medicalPlanData);
    return res.data;
}

export const updateMedicalPlan = async (id: string | number, medicalPlanData: any) => {
    const res = await api.put(`${url}/${id}`, medicalPlanData);
    return res.data;
};

export const deleteMedicalPlan = async (id: string | number) => {
    const res = await api.delete(`${url}/${id}`);
    return res.data;
}