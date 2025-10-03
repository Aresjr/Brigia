import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, Validators } from '@angular/forms';
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
import { abrirDatePicker } from '../../../core/util-methods';

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

  constructor(protected override fb: FormBuilder,
              protected override toastr: ToastrService,
              private especialidadeService: EspecialidadeService) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, Validators.required],
      email: [null, Validators.required],
      cpf: [null],
      dataNascimento: [null],
      sexo: [null],
      celular: [null],
      crm: [null],
      especialidades: [null, Validators.required]
    });
  }

  override ngOnInit() {
    if (this.profissional) {
      this.form.patchValue(this.profissional);
      let esp: number[] = [];
      this.profissional.especialidades?.forEach(e => esp.push(e.id));
      this.form.controls['especialidades'].setValue(esp);
    }
    this.carregarEspecialidades();
  }

  private carregarEspecialidades() {
    this.especialidadeService.listar().subscribe({
      next: (response) => {
        this.listaEspecialidades = response.items;
      }
    });
  }

  protected readonly abrirDatePicker = abrirDatePicker;
}
