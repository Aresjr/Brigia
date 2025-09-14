import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PacienteService } from './paciente.service';
import { Paciente } from './paciente.interface';
import { PacienteDetalhesComponent } from './paciente-detalhes/paciente-detalhes.component';
import { PacienteFormComponent } from './paciente-form/paciente-form.component';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { CpfPipe } from '../../core/pipes/cpf.pipe';
import { CelularPipe } from '../../core/pipes/celular.pipe';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';
import { Router } from '@angular/router';
import { UserService } from '../../core/user.service';

@Component({
  selector: 'app-pacientes',
  imports: [
    CommonModule,
    PacienteDetalhesComponent,
    PacienteFormComponent,
    LucideAngularModule,
    FormsModule,
    CpfPipe,
    CelularPipe,
    PaginationComponent,
    TopBarComponent,
    FabComponent
  ],
  templateUrl: './pacientes.component.html',
  standalone: true
})
export class PacientesComponent extends BaseListComponent<Paciente> implements OnInit {
  override nomeEntidade = 'Paciente';

  constructor(private pacientesService: PacienteService, private toastr: ToastrService,
              private router: Router, private userService: UserService) {
    super();
  }

  ngOnInit(): void {
    this.carregarPacientes();
  }

  carregarPacientes(): void {
    this.isLoading = true;
    this.pacientesService.listar().subscribe({
      next: (response) => {
        this.itensInternos = response.items;
        this.itensExibicao = [...this.itensInternos];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: (error) => {
        this.isLoading = false;
      }
    });
  }

  handleAction(event: Event, action: string, paciente: Paciente) {
    event.stopPropagation();

    switch (action) {
      case 'agendar':
        //TODO: Implementar agendamento de paciente
        this.toastr.warning('Agenda de Paciente será implementada em breve.');
        break;
      case 'historico':
        //TODO: Implementar histórico de paciente
        this.toastr.warning('Histórico de Paciente será implementado em breve.');
        break;
      case 'excluir':
        //TODO: Implementar exclusão de paciente
        this.toastr.warning('Exclusão de Paciente será implementada em breve.');
        break;
    }
  }

  override filter(paciente: Paciente, searchTerm: string): boolean | undefined {
    return paciente.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      paciente.cpf?.includes(searchTerm) ||
      paciente.dataNascimento.includes(searchTerm) ||
      paciente.celular?.includes(searchTerm);
  }

  salvarNovoPaciente(paciente: Partial<Paciente>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.pacientesService.atualizar(id, paciente).subscribe({
        next: () => {
          this.toastr.success('Registro atualizado');
          this.carregarPacientes();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        }
      });
    } else {
      this.pacientesService.criar(paciente).subscribe({
        next: () => {
          this.toastr.success('Paciente cadastrado');
          this.carregarPacientes();
          this.mostrarFormularioNovo = false;
        }
      });
    }
  }

  criarAgendamento(pacienteId: number) {
    return this.router.navigate(['/agenda-diaria'], {
      state: { pacienteId }
    });
  }

  verHistorico(id: number) {
    this.toastr.warning('Histórico de Paciente será implementado em breve.');
  }

  mostraFab() {
    return !this.userService.isMedico();
  }
}
