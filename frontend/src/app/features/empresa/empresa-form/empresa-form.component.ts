import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Empresa, EmpresaRequest, EmpresaPlano } from '../empresa.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';
import { EmpresasService } from '../empresas.service';
import { NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { FormComponent } from '../../shared/form.component';

@Component({
  selector: 'app-empresa-form',
  templateUrl: './empresa-form.component.html',
  standalone: true,
  imports: [
    CommonModule,
    ReactiveFormsModule,
    LucideAngularModule,
    EmptyToNullDirective,
    NgxMaskDirective,
    NgSelectComponent,
    NgOptionComponent
  ]
})
export class EmpresaFormComponent extends FormComponent implements OnInit {
  @Input() empresa: Empresa | null = null;
  @Output() save = new EventEmitter<Partial<EmpresaRequest>>();
  @Output() cancel = new EventEmitter<void>();

  planos: EmpresaPlano[] = [];

  constructor(
    protected override fb: FormBuilder,
    private empresasService: EmpresasService
  ) {
    super(fb);
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      codigoBc: [null],
      valorMinimoMensal: [null],
      minimoPorFuncionario: [null],
      valorMes: [null],
      planoId: [null],
      observacao: [null]
    });
  }

  ngOnInit() {
    this.carregarPlanos();

    if (this.empresa) {
      this.form.patchValue(this.empresa);
    }
  }

  private carregarPlanos() {
    this.empresasService.getPlanos().subscribe(planos => {
      this.planos = planos.items;
    });
  }

  onSubmit() {
    if (this.form.valid) {
      this.save.emit(this.form.value);
    }
  }

  onCancel() {
    this.cancel.emit();
  }

  get isEditMode(): boolean {
    return !!this.empresa;
  }
}
