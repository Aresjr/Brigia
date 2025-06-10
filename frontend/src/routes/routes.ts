import { lazy } from 'react';

const Home = lazy(() => import('@/pages/Home'));
const Patients = lazy(() => import('@/pages/Patients'));
const MedicalPlans = lazy(() => import('@/pages/MedicalPlans'));

export const ROUTES = {
    HOME: '/',
    PATIENTS: '/pacientes',
    MEDICAL_PLANS: '/convenios',
} as const;

export type AppRoute = typeof ROUTES[keyof typeof ROUTES];

interface RouteConfig {
    path: AppRoute;
    component: React.LazyExoticComponent<() => JSX.Element>;
    title: string;
    icon?: string;
}

export const routes: RouteConfig[] = [
    {
        path: ROUTES.HOME,
        component: Home,
        title: 'Página Inicial',
        icon: 'home'
    },
    {
        path: ROUTES.PATIENTS,
        component: Patients,
        title: 'Pacientes',
        icon: 'users'
    },
    {
        path: ROUTES.MEDICAL_PLANS,
        component: MedicalPlans,
        title: 'Convênios',
        icon: 'building'
    }
];
