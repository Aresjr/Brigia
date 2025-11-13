import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormArray, FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import {
  Procedimento,
  ProcedimentoRequest,
  PrecoProcedimentoConvenio,
  PrecoProcedimentoPlano
} from '../procedimento.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { ConvenioService } from '../../convenio/convenio.service';
import { Convenio } from '../../convenio/convenio.interface';
import { EspecialidadeService } from '../../especialidade/especialidade.service';
import { Especialidade } from '../../especialidade/especialidade.interface';
import { EmpresaPlano } from '../../empresa/empresa.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { limitLength } from '../../../core/util-methods';
import { FormComponent } from '../../shared/form.component';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { ToastrService } from 'ngx-toastr';
import { EmpresaService } from '../../empresa/empresa.service';
import { TIPO_AGENDAMENTO } from '../../agenda-diaria/agendamento.interface';
import { UnidadeService } from '../../unidade/unidade.service';
import { Unidade } from '../../unidade/unidade.interface';
import { UserService } from '../../../core/user.service';
import { Role } from '../../../core/constans';
import { ProcedimentoService } from '../procedimento.service';

@Component({
  selector: 'app-procedimento-form',
  templateUrl: './procedimento-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    NgxMaskDirective,
    NgNotFoundTemplateDirective,
    NgOptionComponent,
    NgSelectComponent
  ]
})
export class ProcedimentoFormComponent extends FormComponent<Procedimento, ProcedimentoRequest> implements OnInit {

  convenios: Convenio[] = [];
  planos: EmpresaPlano[] = [];
  especialidades: Especialidade[] = [];
  unidades: Unidade[] = [];
  unidadesExpandidas: { [key: number]: boolean } = {};
  conveniosExpandidosPorUnidade: { [key: number]: boolean } = {};
  planosExpandidosPorUnidade: { [key: number]: boolean } = {};
  precosProcedimentoCarregados: PrecoProcedimentoConvenio[] = [];
  precosPlanosCarregados: PrecoProcedimentoPlano[] = [];
  TIPO_AGENDAMENTO = TIPO_AGENDAMENTO;

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private convenioService: ConvenioService,
    private especialidadeService: EspecialidadeService,
    private empresaService: EmpresaService,
    private unidadeService: UnidadeService,
    protected userService: UserService,
    private procedimentoService: ProcedimentoService
  ) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      codigo: [null],
      observacoes: [null],
      especialidadeId: [null, [Validators.required]],
      duracao: [null, [Validators.min(1), Validators.max(999)]],
      tipo: [null, [Validators.required]],
      precosConvenios: this.fb.array([]),
      precosPlanos: this.fb.array([])
    });
  }

  override ngOnInit() {
    const chamadas:Observable<any[]>[] = [
      this.loadConvenios(),
      this.loadEspecialidades(),
      this.loadPlanos(),
      this.loadUnidades()
    ];

    forkJoin(chamadas).subscribe(() => {
      // Se estiver editando, carregar os preços do procedimento
      if (this.registro?.id) {
        this.carregarPrecos(this.registro.id);
      } else {
        // Se for novo, inicializar os preços vazios
        this.initializePrecosConvenios();
        this.initializePrecosPlanos();
      }

      if (this.registro) {
        this.form.patchValue(this.registro);
        this.form.patchValue({
          especialidadeId: this.registro.especialidade.id
        });
      }
    });
  }

  carregarPrecos(idProcedimento: number) {
    forkJoin({
      precosProcedimento: this.procedimentoService.obterPrecosProcedimento(idProcedimento),
      precosPlanos: this.procedimentoService.obterPrecosPlanos(idProcedimento)
    }).subscribe({
      next: (result) => {
        this.precosProcedimentoCarregados = result.precosProcedimento;
        this.precosPlanosCarregados = result.precosPlanos;

        // Inicializar os preços DEPOIS que tudo foi carregado
        this.initializePrecosConvenios();
        this.initializePrecosPlanos();

        // Preencher os valores dos preços
        const precosConveniosArray = this.form.get('precosConvenios') as FormArray;
        precosConveniosArray.controls.forEach(control => {
          const convenioId = control.value.convenioId;
          const unidadeId = control.value.unidadeId;
          const precoProcedimento = this.precosProcedimentoCarregados
            ?.find(pp => pp.convenio.id === convenioId && pp.unidade?.id === unidadeId);

          if (precoProcedimento) {
            control.patchValue({
              preco: precoProcedimento.preco,
              repasse: precoProcedimento.repasse,
            });
          }
        });

        const precosPlanosArray = this.form.get('precosPlanos') as FormArray;
        precosPlanosArray.controls.forEach(control => {
          const planoId = control.value.planoId;
          const unidadeId = control.value.unidadeId;
          const precoPlano = this.precosPlanosCarregados
            ?.find(pp => pp.plano.id === planoId && pp.unidade?.id === unidadeId);

          if (precoPlano) {
            control.patchValue({
              preco: precoPlano.preco,
              repasse: precoPlano.repasse,
            });
          }
        });
      },
      error: (error) => {
        console.error('Erro ao carregar preços:', error);
        this.initializePrecosConvenios();
        this.initializePrecosPlanos();
      }
    });
  }

  private loadEspecialidades(): Observable<Especialidade[]> {
    return this.especialidadeService.listar()
      .pipe(
        map(response => response.items),
        tap(especialidades => {
          this.especialidades = especialidades
        })
      );
  }

  private loadConvenios(): Observable<Convenio[]> {
    return this.convenioService.listar()
      .pipe(
        map(response => response.items),
        tap(convenios => {
          this.convenios = convenios;
        })
      );
  }

  private loadPlanos(): Observable<EmpresaPlano[]> {
    return this.empresaService.getPlanos()
      .pipe(
        map(response => response.items),
        tap(planos => {
          this.planos = planos;
        })
      );
  }

  private loadUnidades(): Observable<Unidade[]> {
    return this.unidadeService.listar()
      .pipe(
        map(response => response.items),
        tap(unidades => {
          this.unidades = unidades;
          // Inicializar todas as unidades como recolhidas
          this.unidades.forEach(unidade => {
            this.unidadesExpandidas[unidade.id] = false;
            this.conveniosExpandidosPorUnidade[unidade.id] = false;
            this.planosExpandidosPorUnidade[unidade.id] = false;
          });
        })
      );
  }

  private initializePrecosConvenios() {
    const precosArray = this.form.get('precosConvenios') as FormArray;
    precosArray.clear();

    // Para cada unidade, criar um grupo de preços por convênio
    this.unidades.forEach(unidade => {
      this.convenios.forEach(convenio => {
        precosArray.push(this.fb.group({
          unidadeId: [unidade.id],
          unidadeNome: [unidade.nome],
          convenioId: [convenio.id],
          convenioNome: [convenio.nome],
          preco: [0, [Validators.required, Validators.min(0)]],
          repasse: [0]
        }));
      });
    });
  }

  private initializePrecosPlanos() {
    const precosArray = this.form.get('precosPlanos') as FormArray;
    precosArray.clear();

    // Para cada unidade, criar um grupo de preços por plano
    this.unidades.forEach(unidade => {
      this.planos.forEach(plano => {
        precosArray.push(this.fb.group({
          unidadeId: [unidade.id],
          unidadeNome: [unidade.nome],
          planoId: [plano.id],
          nome: [plano.nome],
          preco: [0, [Validators.required, Validators.min(0)]],
          repasse: [0]
        }));
      });
    });
  }

  get precosConvenios() {
    return this.form.get('precosConvenios') as FormArray;
  }

  get precosPlanos() {
    return this.form.get('precosPlanos') as FormArray;
  }

  override onSubmit() {
    if (this.form.valid) {
      const formValue = this.form.value;
      const precosConvenios = formValue.precosConvenios.map((p: any) => ({
        convenioId: p.convenioId,
        unidadeId: p.unidadeId,
        preco: p.preco,
        repasse: p.repasse
      }));

      const precosPlanos = formValue.precosPlanos.map((p: any) => ({
        planoId: p.planoId,
        unidadeId: p.unidadeId,
        preco: p.preco,
        repasse: p.repasse
      }));

      this.save.emit({
        ...formValue,
        precosConvenios: precosConvenios,
        precosPlanos: precosPlanos
      });
    } else {
      this.toastr.warning('Alguns campos não foram preenchidos, verifique');
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  toggleUnidade(unidadeId: number) {
    this.unidadesExpandidas[unidadeId] = !this.unidadesExpandidas[unidadeId];
  }

  isUnidadeExpandida(unidadeId: number): boolean {
    return this.unidadesExpandidas[unidadeId] || false;
  }

  getPrecosPorUnidade(unidadeId: number) {
    return this.precosConvenios.controls.filter(
      control => control.value.unidadeId === unidadeId
    );
  }

  getPrecosPlanosPorUnidade(unidadeId: number) {
    return this.precosPlanos.controls.filter(
      control => control.value.unidadeId === unidadeId
    );
  }

  podeEditarPrecos(): boolean {
    return this.userService.hasRole(Role.ADMIN) || this.userService.hasRole(Role.FATURAMENTO);
  }

  toggleConvenios(unidadeId: number) {
    this.conveniosExpandidosPorUnidade[unidadeId] = !this.conveniosExpandidosPorUnidade[unidadeId];
  }

  isConveniosExpandido(unidadeId: number): boolean {
    return this.conveniosExpandidosPorUnidade[unidadeId] || false;
  }

  togglePlanos(unidadeId: number) {
    this.planosExpandidosPorUnidade[unidadeId] = !this.planosExpandidosPorUnidade[unidadeId];
  }

  isPlanosExpandido(unidadeId: number): boolean {
    return this.planosExpandidosPorUnidade[unidadeId] || false;
  }

  protected readonly limitLength = limitLength;
}
