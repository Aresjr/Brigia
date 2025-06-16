import api from './index';

const url = '/patients';

export const getPatients = async () => {
    const res = await api.get(`${url}?size=9999`);
    return res.data.items;
};

export const getPatient = async (id: string | number) => {
    const res = await api.get(`${url}/${id}`);
    return res.data;
}

export const getPatientMedicalPlan = async (id: string | number) => {
    const res = await api.get(`${url}/${id}/medical-plan`);
    return res.data;
}

export const createPatient = async (patientData: any) => {
    const res = await api.post(url, patientData);
    return res.data;
};

export const getPatientsCount = async () => {
    const res = await api.get(`${url}/count`);
    return res.data.count;
}

export const deletePatient = async (id: string | number) => {
    const res = await api.delete(`${url}/${id}`);
    return res.data;
}

export const getBirthdayPatients = async () => {
    const res = await api.get(`${url}/birthday`);
    return res.data;
}

export const updatePatient = async (id: string | number, patientData: any) => {
    const res = await api.put(`${url}/${id}`, patientData);
    return res.data;
}