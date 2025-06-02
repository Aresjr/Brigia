import api from './index';

const url = '/patients';

export const getPatients = async () => {
    const res = await api.get(url + "?size=9999");
    return res.data.items;
};

export const createPatient = async (patientData: any) => {
    const res = await api.post(url, patientData);
    return res.data;
};