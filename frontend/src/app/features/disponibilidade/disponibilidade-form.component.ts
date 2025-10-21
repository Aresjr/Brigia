import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormArray, ReactiveFormsModule, FormsModule, Validators } from '@angular/forms';
import { NgClass, NgIf, NgFor } from '@angular/common';
import { ToastrService } from 'ngx-toastr';
import { LucideAngularModule } from 'lucide-angular';
import { FormComponent } from '../shared/form.component';
import { IForm } from '../shared/form.interface';
import { Disponibilidade, DisponibilidadeRequest } from './disponibilidade.interface';
import { Profissional } from '../profissionais/profissional.interface';
import { ProfissionalService } from '../profissionais/profissional.service';
import { NgSelectComponent, NgNotFoundTemplateDirective } from '@ng-select/ng-select';
import { forkJoin, map, tap } from 'rxjs';
import { EmptyToNullDirective } from '../../core/directives/empty-to-null-directive';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { AgendaSemanalService } from '../agenda-semanal/agenda-semanal.service';
import { DisponibilidadeService } from './disponibilidade.service';
import { DiasSemana } from '../../core/constans';

@Component({
  selector: 'app-disponibilidade-form',
  templateUrl: './disponibilidade-form.component.html',
  imports: [
    ReactiveFormsModule,
    FormsModule,
    NgClass,
    NgIf,
    NgFor,
    LucideAngularModule,
    NgSelectComponent,
    NgNotFoundTemplateDirective,
    EmptyToNullDirective,
    ConfirmDialogComponent
  ]
})
export class DisponibilidadeFormComponent extends FormComponent<Disponibilidade, DisponibilidadeRequest> implements OnInit {
  @Input() dataDisponibilidade: Date | null = null;
  @Input() profissionalId: number | null = null;
  @Input() disponibilidadeDetalhes: any = null;
  @Output() saved = new EventEmitter<void>();

  titulo: string = 'Nova Agenda do Médico';
  hoje: string;
  profissionais: Profissional[] = [];
  isLoading: boolean = false;
  exibeConfirmCancelamento: boolean = false;
  exibeConfirmExclusao: boolean = false;
  readonly: boolean = false;
  agendaSemanal: boolean = false;
  diasSemana = DiasSemana;

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private profissionalService: ProfissionalService,
    private agendaSemanalService: AgendaSemanalService,
    private disponibilidadeService: DisponibilidadeService
  ) {
    super(fb, toastr);
    this.hoje = new Date().toISOString().split('T')[0];

    const form: IForm<DisponibilidadeRequest> = {
      profissionalId: [null, Validators.required],
      dia: [null, Validators.required],
      horaInicial: [null, Validators.required],
      horaFinal: [null, Validators.required],
      valorAdicional: [null]
    };
    this.form = this.fb.group(form);
    this.form.addControl('horariosSemana', this.fb.array([]));
    this.inicializarHorariosSemana();
  }

  get horariosSemana(): FormArray {
    return this.form.get('horariosSemana') as FormArray;
  }

  inicializarHorariosSemana() {
    this.diasSemana.forEach((dia) => {
      this.horariosSemana.push(this.fb.group({
        diaSemana: [dia.valor],
        ativo: [false],
        horaInicial: [''],
        horaFinal: ['']
      }));
    });
  }

  setTipoAgenda(semanal: boolean) {
    this.agendaSemanal = semanal;

    console.log('this.agendaSemanal', this.agendaSemanal);

    if (this.agendaSemanal) {
      // Modo agenda semanal - tornar campos de dia específico opcionais
      this.form.get('dia')?.clearValidators();
      this.form.get('horaInicial')?.clearValidators();
      this.form.get('horaFinal')?.clearValidators();
    } else {
      // Modo dia específico - tornar campos obrigatórios
      this.form.get('dia')?.setValidators(Validators.required);
      this.form.get('horaInicial')?.setValidators(Validators.required);
      this.form.get('horaFinal')?.setValidators(Validators.required);
    }

    this.form.get('dia')?.updateValueAndValidity();
    this.form.get('horaInicial')?.updateValueAndValidity();
    this.form.get('horaFinal')?.updateValueAndValidity();
  }

  toggleAgendaSemanal() {
    this.setTipoAgenda(!this.agendaSemanal);
  }

  override ngOnInit(): void {
    // Verificar se está em modo readonly (visualizando disponibilidade existente)
    if (this.disponibilidadeDetalhes) {
      this.readonly = true;
      this.titulo = 'Detalhes da Agenda do Médico';

      // Verificar se é agenda semanal
      const isAgendaSemanal = 'diaSemana' in this.disponibilidadeDetalhes;
      if (isAgendaSemanal) {
        this.agendaSemanal = true;
        this.setTipoAgenda(true);
      }
    }

    let dia = this.hoje;
    if (this.dataDisponibilidade) {
      dia = this.dataDisponibilidade.toISOString().split('T')[0];
    }

    this.form.patchValue({
      dia: dia
    });

    this.isLoading = true;
    forkJoin([
      this.carregarProfissionais()
    ]).subscribe(() => {
      setTimeout(()=>{
        if (this.disponibilidadeDetalhes) {
          // Verificar se é agenda semanal ou disponibilidade diária
          const isAgendaSemanal = 'diaSemana' in this.disponibilidadeDetalhes;

          if (isAgendaSemanal) {
            // Preencher form com dados da agenda semanal
            this.form.patchValue({
              profissionalId: this.disponibilidadeDetalhes.profissional.id,
              valorAdicional: this.disponibilidadeDetalhes.valorAdicional
            });

            // Marcar o dia da semana específico como ativo e preencher horários
            const diaSemana = this.disponibilidadeDetalhes.diaSemana;
            const horarioControl = this.horariosSemana.at(diaSemana);
            if (horarioControl) {
              horarioControl.patchValue({
                ativo: true,
                horaInicial: this.disponibilidadeDetalhes.horaInicial,
                horaFinal: this.disponibilidadeDetalhes.horaFinal
              });
            }
          } else {
            // Preencher form com dados da disponibilidade diária
            this.form.patchValue({
              profissionalId: this.disponibilidadeDetalhes.profissional.id,
              dia: this.disponibilidadeDetalhes.dia,
              horaInicial: this.disponibilidadeDetalhes.horaInicial,
              horaFinal: this.disponibilidadeDetalhes.horaFinal,
              valorAdicional: this.disponibilidadeDetalhes.valorAdicional
            });
          }

          // Desabilitar formulário para modo readonly
          this.form.disable();
        } else {
          this.form.patchValue({
            profissionalId: this.profissionalId
          });
        }
      });
      this.isLoading = false;
    });
  }

  carregarProfissionais() {
    return this.profissionalService.listar().pipe(
      map(response => response.items),
      tap(profissionais => this.profissionais = profissionais)
    );
  }

  fechar(confirmou: boolean = false) {
    // Não verificar dirty se estiver em modo readonly
    if (!confirmou && !this.readonly && this.form.dirty) {
      this.exibeConfirmCancelamento = true;
      return;
    }
    this.cancel.emit();
  }

  formValido(): boolean {
    if (!this.form.valid) {
      return false;
    }

    const horaInicial = this.form.value.horaInicial;
    const horaFinal = this.form.value.horaFinal;

    if (horaInicial && horaFinal && horaInicial >= horaFinal) {
      this.toastr.warning('A hora final deve ser maior que a hora inicial');
      return false;
    }

    return true;
  }

  override onSubmit() {

    console.log('onSubmit disponibilidade');

    if (this.agendaSemanal) {
      // Validar agenda semanal
      if (!this.formValidoAgendaSemanal()) {
        return;
      }
      this.salvarAgendaSemanal();
    } else {
      // Validar e salvar disponibilidade normal
      if (this.formValido()) {

        this.salvarDisponibilidade(this.form.value);

      } else {
        Object.keys(this.form.controls).forEach(field => {
          const control = this.form.get(field);
          control?.markAsTouched({ onlySelf: true });
        });
      }
    }
  }

  salvarDisponibilidade(disponibilidade: Partial<DisponibilidadeRequest>) {
    if (this.disponibilidadeDetalhes) {
      // Atualizar disponibilidade existente
      console.log('salvarDisponibilidade');
      this.disponibilidadeService.atualizar(this.disponibilidadeDetalhes.id, disponibilidade).subscribe({
        next: () => {
          this.toastr.success('Disponibilidade atualizada');
          this.saved.emit();
        }
      });
    } else {
      // Criar nova disponibilidade
      this.disponibilidadeService.criar(disponibilidade).subscribe({
        next: () => {
          this.toastr.success('Disponibilidade criada');
          this.saved.emit();
        }
      });
    }
  }

  formValidoAgendaSemanal(): boolean {
    const profissionalId = this.form.value.profissionalId;
    if (!profissionalId) {
      this.toastr.warning('Selecione um profissional');
      return false;
    }

    const horariosAtivos = this.horariosSemana.controls.filter(
      (control: any) => control.value.ativo
    );

    if (horariosAtivos.length === 0) {
      this.toastr.warning('Selecione pelo menos um dia da semana');
      return false;
    }

    // Validar horários de cada dia ativo
    for (const control of horariosAtivos) {
      const horario = control.value;
      if (!horario.horaInicial || !horario.horaFinal) {
        this.toastr.warning('Preencha o horário inicial e final para todos os dias selecionados');
        return false;
      }
      if (horario.horaInicial >= horario.horaFinal) {
        this.toastr.warning('A hora final deve ser maior que a hora inicial');
        return false;
      }
    }

    return true;
  }

  salvarAgendaSemanal() {
    const profissionalId = this.form.value.profissionalId;
    const valorAdicional = this.form.value.valorAdicional;
    const horariosAtivos = this.horariosSemana.controls
      .filter((control: any) => control.value.ativo)
      .map((control: any) => control.value);

    // Criar um registro de agenda semanal para cada dia ativo
    const requests = horariosAtivos.map((horario: any) => {
      return this.agendaSemanalService.criar({
        profissionalId: profissionalId,
        diaSemana: horario.diaSemana,
        horaInicial: horario.horaInicial,
        horaFinal: horario.horaFinal,
        valorAdicional: valorAdicional
      });
    });

    // Executar todas as requisições
    forkJoin(requests).subscribe({
      next: () => {
        this.toastr.success('Agenda semanal criada com sucesso');
        this.saved.emit();
      },
      error: (error) => {
        console.error('Erro ao salvar agenda semanal:', error);
        this.toastr.error('Erro ao salvar agenda semanal');
      }
    });
  }

  habilitarEdicao() {
    // Não permitir edição de agenda semanal
    const isAgendaSemanal = 'diaSemana' in this.disponibilidadeDetalhes;
    if (isAgendaSemanal) {
      this.toastr.warning('Não é possível editar agenda semanal. Exclua e crie uma nova se necessário.');
      return;
    }

    this.readonly = false;
    this.titulo = 'Editar Agenda do Médico';
    this.form.enable();
  }

  solicitarExclusao() {
    this.exibeConfirmExclusao = true;
  }

  confirmarExclusao() {

    if (!this.disponibilidadeDetalhes) {
      return;
    }

    // Verificar se é agenda semanal (tem diaSemana) ou disponibilidade diária (tem dia)
    const isAgendaSemanal = 'diaSemana' in this.disponibilidadeDetalhes;

    if (isAgendaSemanal) {
      // Excluir agenda semanal
      this.agendaSemanalService.excluir(this.disponibilidadeDetalhes.id).subscribe({
        next: () => {
          this.toastr.success('Agenda semanal excluída com sucesso');
          this.exibeConfirmExclusao = false;
        },
        error: () => {
          this.toastr.error('Erro ao excluir agenda semanal');
          this.exibeConfirmExclusao = false;
        }
      });
    } else {
      // Excluir disponibilidade diária
      this.disponibilidadeService.excluir(this.disponibilidadeDetalhes.id).subscribe({
        next: () => {
          this.toastr.success('Agenda diária excluída com sucesso');
          this.exibeConfirmExclusao = false;
        },
        error: () => {
          this.toastr.error('Erro ao excluir agenda');
          this.exibeConfirmExclusao = false;
        }
      });
    }
  }

  cancelarExclusao() {
    this.exibeConfirmExclusao = false;
  }
}
