import api from './index';

const url = '/medical-plans';

export const getMedicalPlans = async () => {
    const res = await api.get(url);
    return res.data;
};
