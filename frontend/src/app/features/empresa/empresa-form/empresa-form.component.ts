import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Empresa, EmpresaPlano, EmpresaRequest } from '../empresa.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';
import { EmpresasService } from '../empresas.service';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { FormComponent } from '../../shared/form.component';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { ColorUtils } from '../../../core/color-utils';
import { ToastrService } from 'ngx-toastr';
import { limitLength } from '../../../core/util-methods';

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
    NgOptionComponent,
    NgNotFoundTemplateDirective
  ]
})
export class EmpresaFormComponent extends FormComponent<EmpresaRequest> implements OnInit {
  @Input() empresa: Empresa | null = null;

  planos: EmpresaPlano[] = [];

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private empresasService: EmpresasService
  ) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, [Validators.required, Validators.minLength(3)]],
      codigoBc: [null],
      cnpj: [null],
      email: [null],
      valorMinimoMensal: [null],
      minimoPorFuncionario: [null],
      valorMes: [null],
      planoId: [null],
      observacao: [null]
    });
  }

  ngOnInit() {
    if (this.empresa) {
      this.form.patchValue(this.empresa);
    }

    forkJoin([
      this.carregarPlanos()
    ]).subscribe(() => {
      this.form.patchValue({
        planoId: this.empresa?.plano?.id
      });
    })
  }

  private carregarPlanos(): Observable<EmpresaPlano[]> {
    return this.empresasService.getPlanos().pipe(
        map(response => response.items),
        tap(planos => this.planos = planos));
  }

  get isEditMode(): boolean {
    return !!this.empresa;
  }

  protected readonly ColorUtils = ColorUtils;
  protected readonly limitLength = limitLength;
}
