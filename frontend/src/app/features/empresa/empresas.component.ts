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

@Component({
  selector: 'app-empresas',
  templateUrl: './empresas.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    EmpresaFormComponent,
    PaginationComponent
  ]
})
export class EmpresasComponent extends BaseListComponent<Empresa> implements OnInit {
  protected Math = Math;
  empresas: Empresa[] = [];

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
        this.empresas = response.items;
        this.items = [...this.empresas];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar empresas. Por favor, tente novamente.');
      }
    });
  }

  onSearch(): void {
    if (this.searchTerm) {
      this.items = this.empresas.filter(empresa =>
        empresa.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        empresa.descricao?.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    } else {
      this.items = [...this.empresas];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  onSalvarNovoEmpresa(empresa: Partial<Empresa>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.empresasService.atualizar(id, empresa).subscribe({
        next: () => {
          this.toastr.success('Convênio atualizado com sucesso');
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
          this.toastr.success('Convênio cadastrado com sucesso');
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

  excluir(event: Event, empresa: Empresa) {
    event.stopPropagation();
    this.dropdownAberto = null;
    if (confirm(`Deseja realmente excluir o empresa ${empresa.nome}?`)) { //TODO - alterar para uma biblioteca de confirmação
      this.empresasService.excluir(empresa.id).subscribe({
        next: () => {
          this.toastr.success('Convênio excluído com sucesso');
          this.carregarEmpresas();
        },
        error: () => {
          this.toastr.error('Erro ao excluir empresa');
        }
      });
    }
  }

  restaurarItem(event: Event, empresa: Empresa) {
    event.stopPropagation();
    this.dropdownAberto = null;

    this.empresasService.restaurar(empresa.id).subscribe({
      next: () => {
        empresa.excluido = false;
        this.toastr.success('Convênio restaurado com sucesso!');
      },
      error: (error) => {
        this.toastr.error('Erro ao restaurar o empresa');
        console.error('Erro ao restaurar empresa:', error);
      }
    });
  }

  pageChange(page: number) {
    this.mudarPagina(page);
  }
}
