import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ConveniosService } from './convenios.service';
import { Convenio } from './convenio.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { ConvenioFormComponent } from './convenio-form/convenio-form.component';
import { BaseListComponent } from '../shared/base-list.component';

@Component({
  selector: 'app-convenios',
  templateUrl: './convenios.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    ConvenioFormComponent
  ]
})
export class ConveniosComponent extends BaseListComponent<Convenio> implements OnInit {
  protected Math = Math;
  convenios: Convenio[] = [];

  constructor(private conveniosService: ConveniosService, private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.carregarConvenios();
  }

  carregarConvenios(): void {
    this.isLoading = true;
    this.conveniosService.listarConvenios().subscribe({
      next: (response) => {
        this.convenios = response.items;
        this.items = [...this.convenios];
        this.atualizarPaginacao();
        this.isLoading = false;
      },
      error: () => {
        this.isLoading = false;
        this.toastr.error('Erro ao carregar convênios. Por favor, tente novamente.');
      }
    });
  }

  onSearch(): void {
    if (this.searchTerm) {
      this.items = this.convenios.filter(convenio =>
        convenio.nome.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
        convenio.descricao?.toLowerCase().includes(this.searchTerm.toLowerCase())
      );
    } else {
      this.items = [...this.convenios];
    }
    this.paginaAtual = 1;
    this.atualizarPaginacao();
  }

  onSalvarNovoConvenio(convenio: Partial<Convenio>) {
    if (this.itemEdicao) {
      const id = this.itemEdicao.id;
      this.conveniosService.atualizarConvenio(id, convenio).subscribe({
        next: () => {
          this.toastr.success('Convênio atualizado com sucesso');
          this.carregarConvenios();
          this.mostrarFormularioNovo = false;
          this.itemEdicao = null;
        },
        error: (e) => {
          const errorMessage: string = e.error.messages?.join('; ') || e.error.message || '';
          this.toastr.error(errorMessage, 'Erro ao atualizar convênio');
        }
      });
    } else {
      this.conveniosService.criarConvenio(convenio).subscribe({
        next: () => {
          this.toastr.success('Convênio cadastrado com sucesso');
          this.carregarConvenios();
          this.mostrarFormularioNovo = false;
        },
        error: (error) => {
          this.toastr.error('Erro ao cadastrar convênio');
          console.error('Erro ao cadastrar convênio:', error);
        }
      });
    }
  }

  excluirConvenio(event: Event, convenio: Convenio) {
    event.stopPropagation();
    this.dropdownAberto = null;
    if (confirm(`Deseja realmente excluir o convênio ${convenio.nome}?`)) {
      this.conveniosService.excluirConvenio(convenio.id).subscribe({
        next: () => {
          this.toastr.success('Convênio excluído com sucesso');
          this.carregarConvenios();
        },
        error: () => {
          this.toastr.error('Erro ao excluir convênio');
        }
      });
    }
  }

  restaurarConvenio(event: Event, convenio: Convenio) {
    event.stopPropagation();
    this.dropdownAberto = null;

    this.conveniosService.restaurarConvenio(convenio.id).subscribe({
      next: () => {
        convenio.excluido = false;
        this.toastr.success('Convênio restaurado com sucesso!');
      },
      error: (error) => {
        this.toastr.error('Erro ao restaurar o convênio');
        console.error('Erro ao restaurar convênio:', error);
      }
    });
  }

}
