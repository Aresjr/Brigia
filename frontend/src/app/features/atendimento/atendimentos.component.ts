import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AtendimentoService } from './atendimento.service';
import { Atendimento, AtendimentoRequest } from './atendimento.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { AtendimentoFormComponent } from './atendimento-form/atendimento-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { Router } from '@angular/router';
import { FabComponent } from '../shared/fab/fab.component';
import { StatusAtendimento } from '../../core/constans';
import { LoadingSpinnerComponent } from '../shared/loading/loading-spinner.component';

@Component({
  selector: 'app-atendimentos',
  templateUrl: './atendimentos.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    AtendimentoFormComponent,
    PaginationComponent,
    ConfirmDialogComponent,
    TopBarComponent,
    FabComponent,
    LoadingSpinnerComponent
  ]
})
export class AtendimentosComponent extends BaseListComponent<Atendimento> implements OnInit {
  override nomeEntidade = 'Atendimento';
  agendamentoId: number;
  atendimentoId: number;

  constructor(private atendimentoService: AtendimentoService, protected override toastr: ToastrService,
              private router: Router) {
    super(atendimentoService, toastr);
    const navigation = this.router.getCurrentNavigation();
    const agendamentoId = navigation?.extras.state?.['agendamentoId'];
    const atendimentoId = navigation?.extras.state?.['atendimentoId'];
    this.agendamentoId = agendamentoId ? agendamentoId : null;
    this.atendimentoId = atendimentoId ? atendimentoId : null;
  }

  override ngOnInit(): void {
    super.ngOnInit();
    if (this.agendamentoId) {
      this.mostrarFormularioNovo = true;
    }
  }

  override searchTermFilter(atendimento: Atendimento, searchTerm: string): boolean | undefined {
    return atendimento.especialidade.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      this.StatusAtendimento[atendimento.status].descricao.toLowerCase().includes(searchTerm.toLowerCase()) ||
      atendimento.paciente.nome.toLowerCase().includes(searchTerm.toLowerCase());
  }

  onSalvarNovoAtendimento(atendimento: Partial<AtendimentoRequest>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.atendimentoService.atualizar(id, atendimento).subscribe({
        next: () => {
          this.toastr.success('Registro atualizado');
          this.carregarRegistros();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        }
      });
    } else if (this.atendimentoId != null) {
      this.atendimentoService.finalizarAtendimento(this.atendimentoId, atendimento)
        .subscribe({
          next: () => {
            this.toastr.success(`${this.nomeEntidade} cadastrado`);
            this.carregarRegistros();
            this.mostrarFormularioNovo = false;
          }
        });
    } else {
      this.atendimentoService.criar(atendimento).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} cadastrado`);
          this.carregarRegistros();
          this.mostrarFormularioNovo = false;
        }
      });
    }
  }

  novoAgendamento() {
    this.toastr.info('Será implementado logo...');
  }

  protected readonly StatusAtendimento = StatusAtendimento;
}
