import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatButtonModule } from '@angular/material/button';
import { MatTableModule } from '@angular/material/table';
import { MatIconModule } from '@angular/material/icon';
import { ProfissionaisService } from '../profissionais/profissionais.service';
import { AgendaDiariaService } from './agenda-diaria.service';
import { Profissional } from '../profissionais/profissional.interface';
import { Disponibilidade } from './disponibilidade.interface';

@Component({
  selector: 'app-agenda-diaria',
  templateUrl: './agenda-diaria.component.html',
  styleUrls: ['./agenda-diaria.component.scss'],
  standalone: true,
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    MatDatepickerModule,
    MatFormFieldModule,
    MatInputModule,
    MatSelectModule,
    MatButtonModule,
    MatTableModule,
    MatIconModule
  ]
})
export class AgendaDiariaComponent implements OnInit {
  profissionais: Profissional[] = [];
  disponibilidades: Disponibilidade[] = [];
  profissionalSelecionado?: number;
  dataSelecionada?: Date;
  displayedColumns = ['horaInicio', 'horaFim', 'intervalo', 'status', 'acoes'];

  constructor(
    private profissionaisService: ProfissionaisService,
    private agendaDiariaService: AgendaDiariaService
  ) {}

  ngOnInit() {
    this.carregarProfissionais();
  }

  carregarProfissionais() {
    this.profissionaisService.listarProfissionais().subscribe(
      response => this.profissionais = response.items
    );
  }

  carregarDisponibilidades() {
    if (this.profissionalSelecionado && this.dataSelecionada) {
      const dataFormatada = this.dataSelecionada.toISOString().split('T')[0];
      this.agendaDiariaService
        .getDisponibilidades(this.profissionalSelecionado, dataFormatada)
        .subscribe(disponibilidades => this.disponibilidades = disponibilidades);
    }
  }

  adicionarDisponibilidade() {
    if (this.profissionalSelecionado && this.dataSelecionada) {
      const novaDisponibilidade: Disponibilidade = {
        profissionalId: this.profissionalSelecionado,
        data: this.dataSelecionada.toISOString().split('T')[0],
        horaInicio: '08:00',
        horaFim: '17:00',
        intervaloMinutos: 30,
        status: 'DISPONIVEL'
      };

      this.agendaDiariaService.salvarDisponibilidade(novaDisponibilidade)
        .subscribe(() => this.carregarDisponibilidades());
    }
  }

  excluirDisponibilidade(id: number) {
    this.agendaDiariaService.excluirDisponibilidade(id)
      .subscribe(() => this.carregarDisponibilidades());
  }
}
