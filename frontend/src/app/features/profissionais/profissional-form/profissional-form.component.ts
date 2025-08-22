import { Component, EventEmitter, Output, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Profissional } from '../profissional.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { ToastrService } from 'ngx-toastr';
import { SEXOS } from '../../../core/constans';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { EspecialidadeService } from '../../especialidade/especialidade.service';
import { Especialidade } from '../../especialidade/especialidade.interface';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';
import { NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-profissional-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective, EmptyToNullDirective, NgMultiSelectDropDownModule, NgSelectComponent, NgOptionComponent, LucideAngularModule],
  templateUrl: 'profissional-form.component.html'
})
export class ProfissionalFormComponent implements OnInit {
  @Input() profissional?: Profissional | null;
  @Output() save = new EventEmitter<Partial<Profissional>>();
  @Output() cancel = new EventEmitter<void>();

  profissionalForm: FormGroup;
  protected readonly SEXOS = SEXOS;
  listaEspecialidades: Especialidade[] = [];

  constructor(private fb: FormBuilder,
              private toastr: ToastrService,
              private especialidadeService: EspecialidadeService) {
    this.profissionalForm = this.fb.group({
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
      this.profissionalForm.patchValue(this.profissional);
      let esp: number[] = [];
      this.profissional.especialidades?.forEach(e => esp.push(e.id));
      this.profissionalForm.controls['especialidades'].setValue(esp);
    }
    this.carregarEspecialidades();
  }

  get isEditMode(): boolean {
    return !!this.profissional;
  }

  onSubmit() {
    if (this.profissionalForm.valid) {
      this.save.emit(this.profissionalForm.value);
    } else {
      Object.keys(this.profissionalForm.controls).forEach(field => {
        const control = this.profissionalForm.get(field);
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
