import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContaReceberService } from './contas-receber.service';
import { ContaReceber } from './contas-receber.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { LoadingSpinnerComponent } from '../shared/loading/loading-spinner.component';
import {
  CorContaReceber,
  StatusContaReceberDescricao
} from '../../core/constans';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { Paciente } from '../pacientes/paciente.interface';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionalService } from '../profissionais/profissional.service';

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
    LoadingSpinnerComponent,
    NgNotFoundTemplateDirective,
    NgSelectComponent,
    ReactiveFormsModule,
    NgOptionComponent
  ]
})
export class ContaReceberComponent extends BaseListComponent<ContaReceber> implements OnInit {
  override nomeEntidade = 'Conta a Receber';
  pacientes: Paciente[] = [];
  profissionais: Profissional[] = [];
  profissionalFiltro: number = 0;

  constructor(private contasReceberService: ContaReceberService,
              private profissionalService: ProfissionalService,
              private toastr: ToastrService) {
    super();
  }

  ngOnInit(): void {
    this.isLoading = true;
    forkJoin([
      this.carregarContasReceber(),
      this.carregarProfissionais(),
    ]).subscribe(() => {
      this.isLoading = false;
    });
  }

  carregarContasReceber() {
    this.isLoading = true;
    return this.contasReceberService.listar(true).pipe(
      map(response => response.items),
      tap(contasReceber => {
        this.itensInternos = contasReceber;
        this.itensExibicao = [...this.itensInternos];
        this.atualizarPaginacao();
      }));
  }

  carregarProfissionais(): Observable<Profissional[]> {
    return this.profissionalService.listar().pipe(
      map(response => response.items),
      tap(profissionais => {
        this.profissionais = profissionais;
      }));
  }

  selectProfissional(profissionalId: number) {
    this.profissionalFiltro = profissionalId | 0;
    this.filtrar();
  }

  filtrar() {
    this.itensExibicao = this.itensInternos.filter(item => {
      return this.profissionalFiltro == 0 || item.profissional.id == this.profissionalFiltro
    });
  }

  override filter(contaReceber: ContaReceber, searchTerm: string): boolean | undefined {
    return contaReceber.paciente.nome.toLowerCase().includes(searchTerm.toLowerCase());
  }

  protected readonly StatusContaReceberDescricao = StatusContaReceberDescricao;
  protected readonly CorContaReceber = CorContaReceber;
}
