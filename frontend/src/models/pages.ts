import { PatientsTable } from "@/components/DataTable/Models/PatientsTable.tsx";
import { MedicalPlansTable } from "@/components/DataTable/Models/MedicalPlansTable.tsx";

export const getPageTitle = (pathname: string) => {
  return pageTitles[pathname]["title"];
};

export const getTableComponent = (pathname: string) => {
  return pageTitles[pathname]["component"];
};

const pageTitles = {
    "/": {
        "title": "Página Inicial"
    },
    "/pacientes": {
        "title": "Pacientes",
        "component": PatientsTable,
        "columns": "cpf, created_at, id, identification_color, last_appointment, name, next_appointment, sex, birth_date, cellphone"
    },
    "/configuracoes": {
        "title": "Configurações"
    },
    "/convenios": {
        "title": "Convênios",
        "component": MedicalPlansTable
    }
};

