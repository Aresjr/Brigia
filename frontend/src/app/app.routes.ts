import { Routes } from '@angular/router';
import { LoginComponent } from './features/auth/login/login.component';
import { LogoutComponent } from './features/auth/logout/logout.component';
import { MainLayoutComponent } from './layout/main-layout/main-layout.component';
import { IndexComponent } from './features/index/index.component';
import { PacientesComponent } from './features/pacientes/pacientes.component';
import { AuthGuard } from './core/guards/auth.guard';
import { ProfissionaisComponent } from './features/profissionais/profissionais.component';
import { AgendamentosComponent } from './features/agendamentos/agendamentos.component';
import { ProcedimentosComponent } from './features/procedimentos/procedimentos.component';
import { TabelaPrecosComponent } from './features/tabela-precos/tabela-precos.component';
import { ConveniosComponent } from './features/convenio/convenios.component';
import { Role } from './core/constans';
import { EspecialidadeComponent } from './features/especialidade/especialidade.component';

export const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'logout', component: LogoutComponent },
  {
    path: '',
    component: MainLayoutComponent,
    canActivate: [AuthGuard],
    canActivateChild: [AuthGuard],
    data: {
      roles: [Role.SECRETARIA, Role.ADMIN, Role.FATURAMENTO]
    },
    children: [
      {
        path: '',
        component: IndexComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.SECRETARIA, Role.ADMIN, Role.FATURAMENTO],
          title: 'Página Inicial'
        },
      },
      {
        path: 'pacientes',
        component: PacientesComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.SECRETARIA, Role.ADMIN],
          title: 'Pacientes'
        },
      },
      {
        path: 'agendamentos',
        component: AgendamentosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.SECRETARIA, Role.ADMIN],
          title: 'Agendamentos'
        },
      },
      {
        path: 'convenios',
        component: ConveniosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.SECRETARIA, Role.ADMIN],
          title: 'Convênios',
        },
      },
      {
        path: 'especialidades',
        component: EspecialidadeComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.SECRETARIA, Role.ADMIN],
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
          roles: [Role.SECRETARIA, Role.ADMIN],
          title: 'Profissionais',
        },
      },
      {
        path: 'tabela-precos',
        component: TabelaPrecosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: [Role.ADMIN, Role.FATURAMENTO],
          title: 'Tabela de Preços',
        },
      },
    ],
  },
];
