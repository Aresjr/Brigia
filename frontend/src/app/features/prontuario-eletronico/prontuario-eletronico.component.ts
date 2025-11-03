import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Paciente } from '../pacientes/paciente.interface';
import { PacienteService } from '../pacientes/paciente.service';
import { Atendimento, StatusAtendimento } from '../atendimento/atendimento.interface';
import { AtendimentoService } from '../atendimento/atendimento.service';

@Component({
  selector: 'app-prontuario-eletronico',
  standalone: true,
  imports: [CommonModule, FormsModule, LucideAngularModule],
  templateUrl: './prontuario-eletronico.component.html'
})
export class ProntuarioEletronicoComponent implements OnInit {
  pacientes: Paciente[] = [];
  pacienteSelecionado: Paciente | null = null;
  atendimentos: Atendimento[] = [];
  atendimentoSelecionado: Atendimento | null = null;
  buscaPaciente: string = '';
  exibirHistorico: boolean = false;
  carregandoPacientes: boolean = false;
  carregandoAtendimentos: boolean = false;

  constructor(
    private pacienteService: PacienteService,
    private atendimentoService: AtendimentoService
  ) {}

  ngOnInit(): void {
    this.carregarPacientes();
  }

  carregarPacientes(): void {
    this.carregandoPacientes = true;
    this.pacienteService.listar().subscribe({
      next: (response) => {
        this.pacientes = response.items;
        this.carregandoPacientes = false;
      },
      error: () => {
        this.carregandoPacientes = false;
      }
    });
  }

  get pacientesFiltrados(): Paciente[] {
    if (!this.pacientes || !Array.isArray(this.pacientes)) {
      return [];
    }
    if (!this.buscaPaciente) {
      return this.pacientes;
    }
    const busca = this.buscaPaciente.toLowerCase();
    return this.pacientes.filter(p =>
      p.nome.toLowerCase().includes(busca) ||
      p.cpf?.includes(busca)
    );
  }

  selecionarPaciente(paciente: Paciente): void {
    this.pacienteSelecionado = paciente;
    this.exibirHistorico = false;
    this.atendimentoSelecionado = null;
    this.buscaPaciente = '';
  }

  limparSelecao(): void {
    this.pacienteSelecionado = null;
    this.exibirHistorico = false;
    this.atendimentos = [];
    this.atendimentoSelecionado = null;
  }

  carregarHistorico(): void {
    if (!this.pacienteSelecionado) return;

    this.exibirHistorico = true;
    this.carregandoAtendimentos = true;

    this.atendimentoService.getByPaciente(this.pacienteSelecionado.id).subscribe({
      next: (atendimentos) => {
        this.atendimentos = atendimentos.sort((a, b) =>
          new Date(b.data).getTime() - new Date(a.data).getTime()
        );
        this.carregandoAtendimentos = false;
      },
      error: () => {
        this.carregandoAtendimentos = false;
      }
    });
  }

  selecionarAtendimento(atendimento: Atendimento): void {
    this.atendimentoSelecionado = atendimento;
  }

  fecharAtendimento(): void {
    this.atendimentoSelecionado = null;
  }

  calcularIdade(dataNascimento: string): number {
    const hoje = new Date();
    const nascimento = new Date(dataNascimento);
    let idade = hoje.getFullYear() - nascimento.getFullYear();
    const mes = hoje.getMonth() - nascimento.getMonth();
    if (mes < 0 || (mes === 0 && hoje.getDate() < nascimento.getDate())) {
      idade--;
    }
    return idade;
  }

  protected readonly StatusAtendimento = StatusAtendimento;
}
