import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProcedimentoService } from './procedimento.service';
import { Procedimento } from './procedimento.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { ProcedimentoFormComponent } from './procedimento-form/procedimento-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ProcedimentoDetalhesComponent } from './procedimento-detalhes/procedimento-detalhes.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';

@Component({
  selector: 'app-procedimentos',
  templateUrl: './procedimentos.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    ProcedimentoFormComponent,
    PaginationComponent,
    ProcedimentoDetalhesComponent,
    ConfirmDialogComponent,
    TopBarComponent,
    FabComponent
  ]
})
export class ProcedimentosComponent extends BaseListComponent<Procedimento> implements OnInit {
  override nomeEntidade = 'Procedimento';

  constructor(private procedimentoService: ProcedimentoService, protected override toastr: ToastrService) {
    super(procedimentoService, toastr);
  }

  override searchTermFilter(procedimento: Procedimento, searchTerm: string): boolean | undefined {
    return procedimento.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      procedimento.codigo?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      procedimento.observacoes?.toLowerCase().includes(searchTerm.toLowerCase()) ||
      procedimento.especialidade.nome?.toLowerCase().includes(searchTerm.toLowerCase());
  }

  mostrarEdicao(procedimento: Procedimento) {
    this.itemEdicao = procedimento;
    this.mostrarFormularioNovo = true;
    this.itemSelecionado = null;
  }
}
