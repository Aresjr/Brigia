
import { format, isValid } from "date-fns";

export const formatDate = (dateString: string) => {
    if (!dateString) return '-';
    try {
        if (dateString.includes('/')) {
            const [day, month, year] = dateString.split('/').map(Number);
            const date = new Date(year, month - 1, day);
            if (!isValid(date)) return dateString;
            return format(date, 'dd/MM/yyyy');
        }
        const date = new Date(dateString);
        if (!isValid(date)) return dateString;
        return format(date, 'dd/MM/yyyy');
    } catch (error) {
        console.error("Erro ao formatar a data:", error, dateString);
        return dateString;
    }
};
