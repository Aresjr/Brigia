import api from './index';

const url = '/procedures';

export const getProcedures = async () => {
    const res = await api.get(url);
    return res.data;
};

export const createProcedure = async (procedureData: any) => {
    const res = await api.post(url, procedureData);
    return res.data;
}

export const updateProcedure = async (id: string | number, medicalPlanData: any) => {
    const res = await api.put(`${url}/${id}`, medicalPlanData);
    return res.data;
};

export const deleteProcedure = async (id: string | number) => {
    const res = await api.delete(`${url}/${id}`);
    return res.data;
}