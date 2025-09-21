import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContaReceberService } from './contas-receber.service';
import { ContaReceber } from './contas-receber.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { LoadingSpinnerComponent } from '../shared/loading/loading-spinner.component';
import {
  CorContaReceber,
  StatusContaReceberDescricao
} from '../../core/constans';

@Component({
  selector: 'app-contas-receber',
  templateUrl: './contas-receber.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    PaginationComponent,
    TopBarComponent,
    LoadingSpinnerComponent
  ]
})
export class ContaReceberComponent extends BaseListComponent<ContaReceber> implements OnInit {
  override nomeEntidade = 'Conta a Receber';

  constructor(private contasReceberService: ContaReceberService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarContasReceber();
  }

  carregarContasReceber(): void {
    this.isLoading = true;
    this.contasReceberService.listar(true).subscribe({
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

  override filter(convenio: ContaReceber, searchTerm: string): boolean | undefined {
    return convenio.paciente.nome.toLowerCase().includes(searchTerm.toLowerCase());
  }

  override excluir() {
    super.excluir();
    this.contasReceberService.excluir(this.idExclusao).subscribe({
      next: () => {
        this.toastr.success(`${this.nomeEntidade} excluído`);
        this.carregarContasReceber();
      }
    });
  }

  restaurarItem(event: Event, convenio: ContaReceber) {
    event.stopPropagation();

    this.contasReceberService.restaurar(convenio.id).subscribe({
      next: () => {
        convenio.excluido = false;
        this.toastr.success(`${this.nomeEntidade} restaurado`);
      }
    });
  }

  protected readonly StatusContaReceberDescricao = StatusContaReceberDescricao;
  protected readonly CorContaReceber = CorContaReceber;
}
