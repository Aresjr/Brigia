import { Component, EventEmitter, Output, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, FormGroup, Validators, AbstractControl } from '@angular/forms';
import { Profissional } from '../profissional.interface';
import { NgxMaskDirective } from 'ngx-mask';
import { ToastrService } from 'ngx-toastr';
import { dropdownSettings, SEXOS } from '../../../core/constans';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { EspecialidadeService } from '../../especialidade/especialidade.service';
import { Especialidade } from '../../especialidade/especialidade.interface';
import { NgMultiSelectDropDownModule } from 'ng-multiselect-dropdown';
import { toggleNumber } from '../../../core/ultil-methods';

@Component({
  selector: 'app-profissional-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, NgxMaskDirective, EmptyToNullDirective, NgMultiSelectDropDownModule],
  templateUrl: 'profissional-form.component.html'
})
export class ProfissionalFormComponent implements OnInit {
  @Input() profissional?: Profissional | null;
  @Output() save = new EventEmitter<Partial<Profissional>>();
  @Output() cancel = new EventEmitter<void>();

  profissionalForm: FormGroup;
  protected readonly SEXOS = SEXOS;
  especialidades: Especialidade[] = [];

  dropdownList:any[] = [];
  selectedItems:[] = [];

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
        this.especialidades = response.items;
        this.popularDropdownEspecialidades();
      },
      error: () => {
        this.toastr.error(`Erro ao carregar a lista de especialidades. Por favor, tente novamente.`);
      }
    });
  }

  private popularDropdownEspecialidades() {
    this.especialidades.forEach(especialidade => {
      this.dropdownList.push({ id: especialidade.id, text: especialidade.nome });
    });
  }

  onItemSelect(item: any) {
    const items = this.profissionalForm.controls['especialidades'].value || [];
    this.profissionalForm.controls['especialidades'].setValue([...items, item.id]);
    console.log(this.profissionalForm.controls['especialidades'].value);
  }

  onItemDeselect(item: any) {
    const items:any[] = this.profissionalForm.controls['especialidades'].value || [];
    this.profissionalForm.controls['especialidades'].setValue(items.filter(n => n !== item.id));
    console.log(this.profissionalForm.controls['especialidades'].value);
  }

  protected readonly dropdownSettings = dropdownSettings;
}
