
import { PatientsTable } from "@/components/DataTable/Models/PatientsTable.tsx";
import { MedicalPlansTable } from "@/components/DataTable/Models/MedicalPlansTable.tsx";
import { ProfessionalsTable } from "@/components/DataTable/Models/ProfessionalsTable.tsx";
import { TableName } from "./tables";
import Appointments from "@/pages/Appointments";

export const getPageTitle = (pathname: string) => {
  return pageTitles[pathname]["title"];
};

export const getTableName = (pathname: string): TableName => {
  return pageTitles[pathname]["table"];
};

export const getTableComponent = (pathname: string) => {
  return pageTitles[pathname]["component"];
};

export const getTableColumns = (pathname: string) => {
  return pageTitles[pathname]["columns"] || '*';
};

const pageTitles = {
    "/": {
        "title": "Página Inicial"
    },
    "/pacientes": {
        "title": "Pacientes",
        "table": TableName.PATIENTS,
        "component": PatientsTable,
        "columns": "cpf, created_at, id, identification_color, last_appointment, name, next_appointment, sex, birth_date, cellphone"
    },
    "/configuracoes": {
        "title": "Configurações"
    },
    "/convenios": {
        "title": "Convênios",
        "table": TableName.MEDICAL_PLANS,
        "component": MedicalPlansTable
    },
    "/profissionais": {
        "title": "Profissionais",
        "table": TableName.PROFESSIONALS,
        "component": ProfessionalsTable,
        "columns": "id, name, email, created_at, specialty, cellphone, cpf, sex, birth_date, crm, identification_color"
    },
    "/procedimentos": {
        "title": "Procedimentos",
        "table": TableName.PROCEDURES,
        "component": null
    },
    "/agendamentos": {
        "title": "Agendamentos",
        "table": null,
        "component": Appointments
    }
};

export const getPagesWithTables = Object.keys(pageTitles).filter(key => pageTitles[key].table);
