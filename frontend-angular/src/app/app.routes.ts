import { Routes } from '@angular/router';
import { LoginComponent } from './features/auth/login/login.component';
import { MainLayoutComponent } from './layout/main-layout/main-layout.component';
import { IndexComponent } from './features/index/index.component';
import { PacientesComponent } from './features/pacientes/pacientes.component';
import { AuthGuard } from './core/guards/auth.guard';
import { ProfissionaisComponent } from './features/profissionais/profissionais.component';
import { AgendamentosComponent } from './features/agendamentos/agendamentos.component';
import { ProcedimentosComponent } from './features/procedimentos/procedimentos.component';
import { TabelaPrecosComponent } from './features/tabela-precos/tabela-precos.component';

export const routes: Routes = [
  { path: 'login', component: LoginComponent },
  {
    path: '',
    component: MainLayoutComponent,
    children: [
      { 
        path: '',
        component: IndexComponent,
        data: {
          roles: ['SECRETARIA', 'ADMIN'],
          title: 'Página Inicial'
        }
      },
      {
        path: 'agendamentos',
        component: AgendamentosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: ['SECRETARIA', 'ADMIN'],
          title: 'Agendamentos'
        },
      },
      {
        path: 'pacientes',
        component: PacientesComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: ['SECRETARIA', 'ADMIN'],
          title: 'Pacientes'
        },
      },
      {
        path: 'procedimentos',
        component: ProcedimentosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: ['SECRETARIA', 'ADMIN'],
          title: 'Procedimentos'
        },
      },
      {
        path: 'profissionais',
        component: ProfissionaisComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: ['SECRETARIA', 'ADMIN'],
          title: 'Profissionais'
        },
      },
      {
        path: 'tabela-precos',
        component: TabelaPrecosComponent,
        canActivate: [AuthGuard],
        canActivateChild: [AuthGuard],
        data: {
          roles: ['SECRETARIA', 'ADMIN'],
          title: 'Tabela de Preços'
        },
      },
    ],
  },
];
