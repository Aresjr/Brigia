import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, Validators, FormArray } from '@angular/forms';
import { Profissional, ProfissionalRequest } from '../profissional.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { SEXOS } from '../../../core/constans';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { EspecialidadeService } from '../../especialidade/especialidade.service';
import { Especialidade } from '../../especialidade/especialidade.interface';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { LucideAngularModule } from 'lucide-angular';
import { FormComponent } from '../../shared/form.component';
import { ToastrService } from 'ngx-toastr';
import { formatDateToBR, formatDateFromBR } from '../../../core/util-methods';
import { Unidade } from '../../unidade/unidade.interface';
import { Convenio } from '../../convenio/convenio.interface';
import { Procedimento } from '../../procedimentos/procedimento.interface';
import { UnidadeService } from '../../unidade/unidade.service';
import { ConvenioService } from '../../convenio/convenio.service';
import { ProcedimentoService } from '../../procedimentos/procedimento.service';
import { RepasseService } from '../../repasse/repasse.service';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { Repasse } from '../../repasse/repasse.interface';

@Component({
  selector: 'app-profissional-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective, EmptyToNullDirective, NgSelectComponent, NgOptionComponent, LucideAngularModule, NgNotFoundTemplateDirective],
  templateUrl: 'profissional-form.component.html'
})
export class ProfissionalFormComponent extends FormComponent<Profissional, ProfissionalRequest> implements OnInit {
  @Input() profissional?: Profissional | null;

  protected readonly SEXOS = SEXOS;
  listaEspecialidades: Especialidade[] = [];
  unidades: Unidade[] = [];
  convenios: Convenio[] = [];
  procedimentos: Procedimento[] = [];
  unidadesExpandidas: { [key: number]: boolean } = {};
  conveniosExpandidosPorUnidade: { [key: string]: boolean } = {};
  repassesCarregados: Repasse[] = [];

  constructor(protected override fb: FormBuilder,
              protected override toastr: ToastrService,
              private especialidadeService: EspecialidadeService,
              private unidadeService: UnidadeService,
              private convenioService: ConvenioService,
              private procedimentoService: ProcedimentoService,
              private repasseService: RepasseService) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, Validators.required],
      email: [null, Validators.required],
      cpf: [null],
      dataNascimento: [null],
      sexo: [null],
      celular: [null],
      crm: [null],
      rqe: [null],
      valorHora: [null],
      especialidades: [null, Validators.required],
      repasses: this.fb.array([])
    });
  }

  override ngOnInit() {
    const chamadas: Observable<any[]>[] = [
      this.loadUnidades(),
      this.loadConvenios(),
      this.loadProcedimentos()
    ];

    forkJoin(chamadas).subscribe(() => {
      // Se estiver editando, carregar os repasses do profissional
      if (this.profissional?.id) {
        this.carregarRepasses(this.profissional.id);
      } else {
        // Se for novo, inicializar os repasses vazios
        this.initializeRepasses();
      }

      if (this.profissional) {
        this.form.patchValue({
          ...this.profissional,
          dataNascimento: formatDateToBR(this.profissional.dataNascimento)
        });
        let esp: number[] = [];
        this.profissional.especialidades?.forEach(e => esp.push(e.id));
        this.form.controls['especialidades'].setValue(esp);
      }
    });

    this.carregarEspecialidades();
  }

  carregarRepasses(idProfissional: number) {
    this.repasseService.obterRepassesPorProfissional(idProfissional).subscribe({
      next: (repasses) => {
        this.repassesCarregados = repasses;
        this.initializeRepasses();

        // Preencher os valores dos repasses
        const repassesArray = this.form.get('repasses') as FormArray;
        repassesArray.controls.forEach(control => {
          const unidadeId = control.value.unidadeId;
          const convenioId = control.value.convenioId;
          const procedimentoId = control.value.procedimentoId;

          const repasse = this.repassesCarregados?.find(
            r => r.unidade.id === unidadeId &&
                 r.convenio.id === convenioId &&
                 r.procedimento.id === procedimentoId
          );

          if (repasse) {
            control.patchValue({
              valor: repasse.valor
            });
          }
        });
      },
      error: (error) => {
        console.error('Erro ao carregar repasses:', error);
        this.initializeRepasses();
      }
    });
  }

  private loadUnidades(): Observable<Unidade[]> {
    return this.unidadeService.listar()
      .pipe(
        map(response => response.items),
        tap(unidades => {
          this.unidades = unidades;
          this.unidades.forEach(unidade => {
            this.unidadesExpandidas[unidade.id] = false;
          });
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

  private loadProcedimentos(): Observable<Procedimento[]> {
    return this.procedimentoService.listar()
      .pipe(
        map(response => response.items),
        tap(procedimentos => {
          this.procedimentos = procedimentos;
        })
      );
  }

  private initializeRepasses() {
    const repassesArray = this.form.get('repasses') as FormArray;
    repassesArray.clear();

    // Para cada unidade, para cada convênio, para cada procedimento
    this.unidades.forEach(unidade => {
      this.convenios.forEach(convenio => {
        this.procedimentos.forEach(procedimento => {
          repassesArray.push(this.fb.group({
            unidadeId: [unidade.id],
            unidadeNome: [unidade.nome],
            convenioId: [convenio.id],
            convenioNome: [convenio.nome],
            procedimentoId: [procedimento.id],
            procedimentoNome: [procedimento.nome],
            valor: [0, [Validators.min(0)]]
          }));
        });
      });
    });
  }

  private carregarEspecialidades() {
    this.especialidadeService.listar().subscribe({
      next: (response) => {
        this.listaEspecialidades = response.items;
      }
    });
  }

  override onSubmit() {
    if (this.form.valid) {
      const formValue = this.form.value;
      const repasses = formValue.repasses
        .filter((r: any) => r.valor > 0) // Só envia repasses com valor maior que zero
        .map((r: any) => ({
          unidadeId: r.unidadeId,
          convenioId: r.convenioId,
          procedimentoId: r.procedimentoId,
          valor: r.valor
        }));

      const payload = {
        ...formValue,
        dataNascimento: formatDateFromBR(formValue.dataNascimento),
        repasses: repasses
      };

      this.save.emit(payload);
    } else {
      console.log('Inválido');
      console.log(this.form);

      const controls = this.form.controls;
      for (const name in controls) {
        if (controls[name].invalid) {
          console.log(name);
          console.log(controls[name]);
        }
      }

      this.toastr.warning('Verifique os campos preenchidos');
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  get repasses() {
    return this.form.get('repasses') as FormArray;
  }

  toggleUnidade(unidadeId: number) {
    this.unidadesExpandidas[unidadeId] = !this.unidadesExpandidas[unidadeId];
  }

  isUnidadeExpandida(unidadeId: number): boolean {
    return this.unidadesExpandidas[unidadeId] || false;
  }

  toggleConvenio(key: string) {
    this.conveniosExpandidosPorUnidade[key] = !this.conveniosExpandidosPorUnidade[key];
  }

  isConvenioExpandido(key: string): boolean {
    return this.conveniosExpandidosPorUnidade[key] || false;
  }

  getRepassesPorUnidadeEConvenio(unidadeId: number, convenioId: number) {
    return this.repasses.controls.filter(
      control => control.value.unidadeId === unidadeId && control.value.convenioId === convenioId
    );
  }

  getConveniosPorUnidade(unidadeId: number) {
    // Retorna convênios únicos que têm procedimentos para esta unidade
    const conveniosIds = new Set(
      this.repasses.controls
        .filter(control => control.value.unidadeId === unidadeId)
        .map(control => control.value.convenioId)
    );

    return this.convenios.filter(c => conveniosIds.has(c.id));
  }
}
