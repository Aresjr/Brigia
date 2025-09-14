import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AtendimentosService } from './atendimentos.service';
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
import { CorAtendimento, StatusAtendimentoDescricao } from '../../core/constans';

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
    FabComponent
  ]
})
export class AtendimentosComponent extends BaseListComponent<Atendimento> implements OnInit {
  override nomeEntidade = 'Atendimento';
  agendamentoId: number;
  atendimentoId: number;

  constructor(private atendimentosService: AtendimentosService, private toastr: ToastrService,
              private router: Router) {
    super();
    const navigation = this.router.getCurrentNavigation();
    const agendamentoId = navigation?.extras.state?.['agendamentoId'];
    const atendimentoId = navigation?.extras.state?.['atendimentoId'];
    this.agendamentoId = agendamentoId ? agendamentoId : null;
    this.atendimentoId = atendimentoId ? atendimentoId : null;
  }

  ngOnInit(): void {
    this.carregarAtendimentos();
    if (this.agendamentoId) {
      this.mostrarFormularioNovo = true;
    }
  }

  carregarAtendimentos(): void {
    this.isLoading = true;
    this.atendimentosService.listar(true).subscribe({
      next: (response) => {
        this.itensInternos = response.items;
        this.itensExibicao = [...this.itensInternos];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
      }
    });
  }

  override filter(atendimento: Atendimento, searchTerm: string): boolean | undefined {
    return atendimento.especialidade.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      this.StatusAtendimentoDescricao[atendimento.status].toLowerCase().includes(searchTerm.toLowerCase()) ||
      atendimento.paciente.nome.toLowerCase().includes(searchTerm.toLowerCase());
  }

  onSalvarNovoAtendimento(atendimento: Partial<AtendimentoRequest>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.atendimentosService.atualizar(id, atendimento).subscribe({
        next: () => {
          this.toastr.success('Registro atualizado');
          this.carregarAtendimentos();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        }
      });
    } else if (this.atendimentoId != null) {
      this.atendimentosService.finalizarAtendimento(this.atendimentoId, atendimento)
        .subscribe({
          next: () => {
            this.toastr.success(`${this.nomeEntidade} cadastrado`);
            this.carregarAtendimentos();
            this.mostrarFormularioNovo = false;
          }
        });
    } else {
      this.atendimentosService.criar(atendimento).subscribe({
        next: () => {
          this.toastr.success(`${this.nomeEntidade} cadastrado`);
          this.carregarAtendimentos();
          this.mostrarFormularioNovo = false;
        }
      });
    }
  }

  override excluir() {
    super.excluir();
    this.atendimentosService.excluir(this.idExclusao).subscribe({
      next: () => {
        this.toastr.success(`${this.nomeEntidade} excluído`);
        this.carregarAtendimentos();
      }
    });
  }

  restaurarItem(event: Event, atendimento: Atendimento) {
    event.stopPropagation();

    this.atendimentosService.restaurar(atendimento.id).subscribe({
      next: () => {
        atendimento.excluido = false;
        this.toastr.success(`${this.nomeEntidade} restaurado`);
      }
    });
  }

  novoAgendamento() {
    this.toastr.info('Será implementado logo...');
  }

  protected readonly CorAtendimento = CorAtendimento;
  protected readonly StatusAtendimentoDescricao = StatusAtendimentoDescricao;
}
