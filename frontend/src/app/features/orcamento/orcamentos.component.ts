import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { OrcamentoService } from './orcamento.service';
import { Orcamento, OrcamentoRequest } from './orcamento.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { Router } from '@angular/router';
import { LoadingSpinnerComponent } from '../shared/loading/loading-spinner.component';
import { OrcamentoFormComponent } from './orcamento-form.component';

@Component({
  selector: 'app-orcamentos',
  templateUrl: './orcamentos.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    PaginationComponent,
    TopBarComponent,
    LoadingSpinnerComponent,
    OrcamentoFormComponent
  ]
})
export class OrcamentosComponent extends BaseListComponent<Orcamento> implements OnInit {
  override nomeEntidade = 'Orçamento';
  orcamentoDetalhes: Orcamento | null = null;
  dataOrcamento: Date | null = null;
  duracaoDisponibilidade: number | null = null;
  pacienteId: number | null = null;

  constructor(private orcamentoService: OrcamentoService, protected override toastr: ToastrService,
              private router: Router) {
    super(orcamentoService, toastr);
  }

  override ngOnInit(): void {
    super.ngOnInit();
  }

  override searchTermFilter(orcamento: Orcamento, searchTerm: string): boolean | undefined {
    return orcamento.paciente.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      (orcamento.especialidade?.nome.toLowerCase().includes(searchTerm.toLowerCase()) ?? false) ||
      (orcamento.procedimento?.nome.toLowerCase().includes(searchTerm.toLowerCase()) ?? false);
  }

  override selecionar(orcamento: Orcamento) {
    this.orcamentoDetalhes = orcamento;
    this.itemEdicao = orcamento;
    this.mostrarFormularioNovo = true;
  }

  override cancelarNovo() {
    this.mostrarFormularioNovo = false;
    this.itemEdicao = null;
    this.orcamentoDetalhes = null;
    this.dataOrcamento = null;
    this.duracaoDisponibilidade = null;
    this.pacienteId = null;
  }

  salvar(orcamento: Partial<OrcamentoRequest>) {
    if (this.itemEdicao?.id) {
      this.orcamentoService.atualizar(this.itemEdicao.id, orcamento as OrcamentoRequest).subscribe({
        next: () => {
          this.toastr.success(`Orçamento atualizado`);
          this.carregarRegistros();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
          this.orcamentoDetalhes = null;
        }
      });
    } else {
      this.orcamentoService.criar(orcamento as OrcamentoRequest).subscribe({
        next: () => {
          this.toastr.success(`Orçamento criado`);
          this.carregarRegistros();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        }
      });
    }
  }

}

