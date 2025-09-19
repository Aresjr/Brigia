import { Routes } from '@angular/router';
import { LoginComponent } from './features/auth/login/login.component';
import { MainLayoutComponent } from './layout/main-layout/main-layout.component';
import { IndexComponent } from './features/index/index.component';
import { PacientesComponent } from './features/pacientes/pacientes.component';
import { AuthGuard } from './core/guards/auth.guard';
import { ProfissionaisComponent } from './features/profissionais/profissionais.component';
import { AgendaDiariaComponent } from './features/agenda-diaria/agenda-diaria.component';
import { ProcedimentosComponent } from './features/procedimentos/procedimentos.component';
import { ConveniosComponent } from './features/convenio/convenios.component';
import { Role } from './core/constans';
import { EspecialidadeComponent } from './features/especialidade/especialidade.component';
import { EmpresasComponent } from './features/empresa/empresas.component';
import { AtendimentosComponent } from './features/atendimento/atendimentos.component';
import { ContaReceberComponent } from './features/contas-receber/contas-receber.component';
import { NotFoundComponent } from './pages/not-found/not-found.component';

export const routes: Routes = [
  { path: 'login', component: LoginComponent },
  {
    path: '',
    component: MainLayoutComponent,
    canActivate: [AuthGuard],
    canActivateChild: [AuthGuard],
    data: {
      roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.FATURAMENTO, Role.MEDICO]
    },
    children: [
      {
        path: '',
        component: IndexComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.FATURAMENTO, Role.MEDICO],
          title: 'Página Inicial'
        },
      },
      {
        path: 'pacientes',
        component: PacientesComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.FATURAMENTO, Role.MEDICO],
          title: 'Pacientes'
        },
      },
      {
        path: 'agenda-diaria',
        component: AgendaDiariaComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.MEDICO],
          title: 'Agenda Diária'
        },
      },
      {
        path: 'atendimentos',
        component: AtendimentosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.MEDICO],
          title: 'Atendimentos'
        },
      },
      {
        path: 'convenios',
        component: ConveniosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.FATURAMENTO],
          title: 'Convênios',
        },
      },
      {
        path: 'especialidades',
        component: EspecialidadeComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.FATURAMENTO],
          title: 'Especialidades',
        },
      },
      {
        path: 'procedimentos',
        component: ProcedimentosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.ADMIN, Role.FATURAMENTO],
          title: 'Procedimentos',
        },
      },
      {
        path: 'profissionais',
        component: ProfissionaisComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.FATURAMENTO],
          title: 'Profissionais',
        },
      },
      {
        path: 'empresas',
        component: EmpresasComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.FATURAMENTO],
          title: 'Empresas',
        },
      },
      {
        path: 'contas-receber',
        component: ContaReceberComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.ADMIN, Role.FATURAMENTO],
          title: 'Contas a Receber',
        },
      },
    ],
  },
  { path: '**', component: NotFoundComponent }
];
