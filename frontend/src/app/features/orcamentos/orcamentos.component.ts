import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';
import { Orcamento } from './orcamento.interface';
import { OrcamentoService } from './orcamento.service';
import { CurrencyPipe } from '@angular/common';
import { ConvenioFormComponent } from '../convenio/convenio-form/convenio-form.component';

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
    FabComponent,
    CurrencyPipe,
    ConvenioFormComponent
  ]
})
export class OrcamentosComponent extends BaseListComponent<Orcamento> {
  override nomeEntidade = 'Orçamento';

  constructor(
    private orcamentoService: OrcamentoService,
    protected override toastr: ToastrService
  ) {
    super(orcamentoService, toastr);
  }

  override searchTermFilter(orcamento: Orcamento, searchTerm: string): boolean {
    return orcamento.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      (orcamento.descricao?.toLowerCase() || '').includes(searchTerm.toLowerCase()) ||
      (orcamento.clienteNome?.toLowerCase() || '').includes(searchTerm.toLowerCase()) ||
      (orcamento.status?.toLowerCase() || '').includes(searchTerm.toLowerCase());
  }

}
