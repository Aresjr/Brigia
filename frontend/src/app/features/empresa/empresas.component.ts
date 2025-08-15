import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EmpresasService } from './empresas.service';
import { Empresa } from './empresa.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { EmpresaFormComponent } from './empresa-form/empresa-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';

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
    TopBarComponent
  ]
})
export class EmpresasComponent extends BaseListComponent<Empresa> implements OnInit {

  constructor(private empresasService: EmpresasService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarEmpresas();
  }

  carregarEmpresas(): void {
    this.isLoading = true;
    this.empresasService.listar(true).subscribe({
      next: (response) => {
        this.itensInternos = response.items;
        this.itensExibicao = [...this.itensInternos];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar empresas. Por favor, tente novamente.');
      }
    });
  }

  override filter(empresa: Empresa, searchTerm: string): boolean | undefined {
    return empresa.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      empresa.descricao?.toLowerCase().includes(searchTerm.toLowerCase());
  }

  onSalvarNovoEmpresa(empresa: Partial<Empresa>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.empresasService.atualizar(id, empresa).subscribe({
        next: () => {
          this.toastr.success('Registro atualizado com sucesso');
          this.carregarEmpresas();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error?.messages?.join('; ') || e.error?.message || '';
          this.toastr.error(errorMessage, 'Erro ao atualizar empresa');
        }
      });
    } else {
      this.empresasService.criar(empresa).subscribe({
        next: () => {
          this.toastr.success('Empresa cadastrado com sucesso');
          this.carregarEmpresas();
          this.mostrarFormularioNovo = false;
        },
        error: (error) => {
          this.toastr.error('Erro ao cadastrar empresa');
          console.error('Erro ao cadastrar empresa:', error);
        }
      });
    }
  }

  excluir() {
    this.empresasService.excluir(this.idExclusao).subscribe({
      next: () => {
        this.toastr.success('Empresa excluída com sucesso');
        this.carregarEmpresas();
      },
      error: () => {
        this.toastr.error('Erro ao excluir empresa');
      }
    });
  }

  restaurarItem(event: Event, empresa: Empresa) {
    event.stopPropagation();
    this.dropdownAberto = null;

    this.empresasService.restaurar(empresa.id).subscribe({
      next: () => {
        empresa.excluido = false;
        this.toastr.success('Empresa restaurado com sucesso!');
      },
      error: (error) => {
        this.toastr.error('Erro ao restaurar o empresa');
        console.error('Erro ao restaurar empresa:', error);
      }
    });
  }
}
