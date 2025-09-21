import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EmpresaService } from './empresa.service';
import { Empresa } from './empresa.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { EmpresaFormComponent } from './empresa-form/empresa-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { ColorUtils } from '../../core/color-utils';
import { FabComponent } from '../shared/fab/fab.component';
import { CnpjPipe } from '../../core/pipes/cnpj.pipe';

@Component({
  selector: 'app-empresas',
  templateUrl: './empresas.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    EmpresaFormComponent,
    PaginationComponent,
    ConfirmDialogComponent,
    TopBarComponent,
    FabComponent,
    CnpjPipe
  ]
})
export class EmpresasComponent extends BaseListComponent<Empresa> implements OnInit {
  override nomeEntidade = 'Empresa';

  constructor(private empresaService: EmpresaService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarEmpresas();
  }

  carregarEmpresas(): void {
    this.isLoading = true;
    this.empresaService.listar(true).subscribe({
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

  override filter(empresa: Empresa, searchTerm: string): boolean | undefined {
    return empresa.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      empresa.observacao?.toLowerCase().includes(searchTerm.toLowerCase());
  }

  onSalvarNovoEmpresa(empresa: Partial<Empresa>) {
    const itemEdicao = this.itemEdicao || this.itemSelecionado;
    if (itemEdicao) {
      const id = itemEdicao.id;
      this.empresaService.atualizar(id, empresa).subscribe({
        next: () => {
          this.toastr.success('Registro atualizado');
          this.carregarEmpresas();
          this.mostrarFormularioNovo = false;
          this.mostrarDetalhes = false;
          this.itemEdicao = null;
          this.itemSelecionado = null;
        }
      });
    } else {
      this.empresaService.criar(empresa).subscribe({
        next: () => {
          this.toastr.success('Empresa cadastrada');
          this.carregarEmpresas();
          this.mostrarFormularioNovo = false;
        }
      });
    }
  }

  override excluir() {
    super.excluir();
    this.empresaService.excluir(this.idExclusao).subscribe({
      next: () => {
        this.toastr.success('Empresa excluída');
        this.carregarEmpresas();
      }
    });
  }

  restaurarItem(event: Event, empresa: Empresa) {
    event.stopPropagation();

    this.empresaService.restaurar(empresa.id).subscribe({
      next: () => {
        empresa.excluido = false;
        this.toastr.success('Empresa restaurada');
      }
    });
  }

  protected readonly ColorUtils = ColorUtils;
}
