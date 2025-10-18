import { Component, Input, OnInit } from '@angular/core';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { NgClass, NgIf } from '@angular/common';
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

@Component({
  selector: 'app-disponibilidade-form',
  templateUrl: './disponibilidade-form.component.html',
  imports: [
    ReactiveFormsModule,
    NgClass,
    NgIf,
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

  titulo: string = 'Nova Disponibilidade';
  hoje: string;
  profissionais: Profissional[] = [];
  isLoading: boolean = false;
  exibeConfirmCancelamento: boolean = false;
  readonly: boolean = false;

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private profissionalService: ProfissionalService
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
  }

  override ngOnInit(): void {
    // Verificar se está em modo readonly (visualizando disponibilidade existente)
    if (this.disponibilidadeDetalhes) {
      this.readonly = true;
      this.titulo = 'Detalhes da Disponibilidade';
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
          // Preencher form com dados da disponibilidade
          this.form.patchValue({
            profissionalId: this.disponibilidadeDetalhes.profissional.id,
            dia: this.disponibilidadeDetalhes.dia,
            horaInicial: this.disponibilidadeDetalhes.horaInicial,
            horaFinal: this.disponibilidadeDetalhes.horaFinal,
            valorAdicional: this.disponibilidadeDetalhes.valorAdicional
          });
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
    if (this.formValido()) {
      this.save.emit(this.form.value);
    } else {
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  habilitarEdicao() {
    this.readonly = false;
    this.titulo = 'Editar Disponibilidade';
    this.form.enable();
  }
}
