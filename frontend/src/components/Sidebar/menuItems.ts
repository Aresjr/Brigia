
import {
  Home,
  UserPlus,
  Building2,
  Users, Stethoscope, Calendar
} from "lucide-react";
import { MenuItem } from "./types";

export const useMenuItems = (): MenuItem[] => {
  return [
    { label: "Página Inicial", icon: Home, path: "/" },
    { label: "Pacientes", icon: Users, path: "/pacientes" },
    { label: "Agendamentos", icon: Calendar, path: "/agendamentos" },
    { 
      label: "Cadastros",
      icon: UserPlus,
      items: [
        { label: "Profissionais", icon: Stethoscope, path: "/profissionais" },
        { label: "Convênios", icon: Building2, path: "/convenios" }
      ]
    },
  ];
};
