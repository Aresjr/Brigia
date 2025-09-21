import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormBuilder, ReactiveFormsModule, Validators } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { Empresa, EmpresaPlano, EmpresaRequest } from '../empresa.interface';
import { EmptyToNullDirective } from '../../../core/directives/empty-to-null-directive';
import { NgxMaskDirective } from 'ngx-mask';
import { EmpresaService } from '../empresa.service';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { FormComponent } from '../../shared/form.component';
import { forkJoin, map, Observable, tap } from 'rxjs';
import { ColorUtils } from '../../../core/color-utils';
import { ToastrService } from 'ngx-toastr';

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
  @Input() isDetalhes: boolean = false;

  planos: EmpresaPlano[] = [];

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private empresaService: EmpresaService
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
      if (this.isDetalhes) {
        this.form.disable();
      }
    })
  }

  private carregarPlanos(): Observable<EmpresaPlano[]> {
    return this.empresaService.getPlanos().pipe(
        map(response => response.items),
        tap(planos => this.planos = planos));
  }

  get isEditMode(): boolean {
    return !!this.empresa;
  }

  getTitulo(): string {
    if (this.isDetalhes) {
      return 'Detalhes Empresa';
    } else if(this.empresa && !this.isDetalhes) {
      return 'Editar Empresa';
    } else {
      return 'Nova Empresa';
    }
  }

  habilitaEdicao() {
    this.form.enable();
    this.isDetalhes = false;
  }

  protected readonly ColorUtils = ColorUtils;
}
