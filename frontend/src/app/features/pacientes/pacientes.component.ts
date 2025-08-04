import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PacientesService } from './pacientes.service';
import { Paciente } from './paciente.interface';
import { PacienteDetalhesComponent } from './paciente-detalhes/paciente-detalhes.component';
import { PacienteFormComponent } from './paciente-form/paciente-form.component';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { CpfPipe } from '../../core/pipes/cpf.pipe';
import { CelularPipe } from '../../core/pipes/celular.pipe';
import { BaseListComponent } from '../shared/base-list.component';

@Component({
  selector: 'app-pacientes',
  imports: [
    CommonModule,
    PacienteDetalhesComponent,
    PacienteFormComponent,
    LucideAngularModule,
    FormsModule,
    CpfPipe,
    CelularPipe
  ],
  templateUrl: './pacientes.component.html',
  standalone: true
})
export class PacientesComponent extends BaseListComponent<Paciente> implements OnInit {
  protected Math = Math;
  pacientes: Paciente[] = [];
  isLoading = true;
  pacienteSelecionado: Paciente | null = null;
  mostrarFormularioNovo = false;
  pacienteEmEdicao: Paciente | null = null;

  constructor(private pacientesService: PacientesService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarPacientes();
  }

  carregarPacientes(): void {
    this.isLoading = true;
    this.pacientesService.listarPacientes().subscribe({
      next: (response) => {
        this.pacientes = response.items;
        this.items = [...this.pacientes];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: (error) => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar pacientes. Por favor, tente novamente.');
      }
    });
  }

  selecionarPaciente(paciente: Paciente): void {
    this.pacienteSelecionado = paciente;
  }

  fecharDetalhes(): void {
    this.pacienteSelecionado = null;
  }

  handleAction(event: Event, action: string, paciente: Paciente) {
    event.stopPropagation();
    this.dropdownAberto = null;

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

  onSearch(): void {
    if (this.searchTerm) {
      this.items = this.pacientes.filter(paciente =>
        paciente.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        paciente.cpf?.includes(this.searchTerm) ||
        paciente.dataNascimento.includes(this.searchTerm) ||
        paciente.celular?.includes(this.searchTerm)
      );
    } else {
      this.items = [...this.pacientes];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  onAddNovoPaciente() {
    this.mostrarFormularioNovo = true;
    this.pacienteSelecionado = null;
  }

  onSalvarNovoPaciente(paciente: Partial<Paciente>) {
    if (this.pacienteEmEdicao) {
      const id = this.pacienteEmEdicao.id;
      this.pacientesService.atualizarPaciente(id, paciente).subscribe({
        next: () => {
          this.toastr.success('Paciente atualizado com sucesso');
          this.carregarPacientes();
          this.mostrarFormularioNovo = false;
          this.pacienteEmEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error.messages?.join('; ') || e.error.message || '';
          this.toastr.error(errorMessage, 'Erro ao atualizar paciente');
          console.error('Erro ao atualizar paciente:', e.error);
        }
      });
    } else {
      this.pacientesService.criarPaciente(paciente).subscribe({
        next: () => {
          this.toastr.success('Paciente cadastrado com sucesso');
          this.carregarPacientes();
          this.mostrarFormularioNovo = false;
        },
        error: (e) => {
          const errorMessage: string = e.error.messages?.join('; ') || e.error.message || '';
          this.toastr.error(errorMessage, 'Erro ao cadastrar paciente');
          console.error('Erro ao cadastrar paciente:', e);
        }
      });
    }
  }

  onCancelarNovoPaciente() {
    this.mostrarFormularioNovo = false;
    this.pacienteEmEdicao = null;
  }

  editarPaciente(event: Event, paciente: Paciente) {
    event.stopPropagation();
    this.pacienteEmEdicao = paciente;
    this.mostrarFormularioNovo = true;
  }
}
