import { Component, EventEmitter, Output, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Profissional, ProfissionalRequest } from '../profissional.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { SEXOS } from '../../../core/constans';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { EspecialidadeService } from '../../especialidade/especialidade.service';
import { Especialidade } from '../../especialidade/especialidade.interface';
import { NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { LucideAngularModule } from 'lucide-angular';
import { FormComponent } from '../../shared/form.component';

@Component({
  selector: 'app-profissional-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective, EmptyToNullDirective, NgSelectComponent, NgOptionComponent, LucideAngularModule],
  templateUrl: 'profissional-form.component.html'
})
export class ProfissionalFormComponent extends FormComponent implements OnInit {
  @Input() profissional?: Profissional | null;
  @Output() save = new EventEmitter<Partial<ProfissionalRequest>>();
  @Output() cancel = new EventEmitter<void>();

  protected readonly SEXOS = SEXOS;
  listaEspecialidades: Especialidade[] = [];

  constructor(protected override fb: FormBuilder,
              private especialidadeService: EspecialidadeService) {
    super(fb);
    this.form = this.fb.group({
      nome: [null, Validators.required],
      email: [null],
      cpf: [null],
      dataNascimento: [null, Validators.required],
      sexo: [null],
      celular: [null],
      crm: [null],
      especialidades: [null, Validators.required]
    });
  }

  ngOnInit() {
    if (this.profissional) {
      this.form.patchValue(this.profissional);
      let esp: number[] = [];
      this.profissional.especialidades?.forEach(e => esp.push(e.id));
      this.form.controls['especialidades'].setValue(esp);
    }
    this.carregarEspecialidades();
  }

  get isEditMode(): boolean {
    return !!this.profissional;
  }

  onSubmit() {
    if (this.form.valid) {
      this.save.emit(this.form.value);
    } else {
      Object.keys(this.form.controls).forEach(field => {
        const control = this.form.get(field);
        control?.markAsTouched({ onlySelf: true });
      });
    }
  }

  onCancel() {
    this.cancel.emit();
  }

  private carregarEspecialidades() {
    this.especialidadeService.listar().subscribe({
      next: (response) => {
        this.listaEspecialidades = response.items;
      }
    });
  }
}
