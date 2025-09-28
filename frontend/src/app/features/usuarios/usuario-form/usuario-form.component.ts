import { Component, Input, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule, FormBuilder, Validators } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { LucideAngularModule } from 'lucide-angular';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { FormComponent } from '../../shared/form.component';
import { Usuario, UsuarioRequest } from '../usuario.interface';
import { Role } from '../../../core/constans';
import { UnidadeService } from '../../unidade/unidade.service';
import { Unidade } from '../../unidade/unidade.interface';

@Component({
  selector: 'app-usuario-form',
  standalone: true,
  imports: [CommonModule, FormsModule, ReactiveFormsModule, LucideAngularModule, NgOptionComponent, NgSelectComponent, NgNotFoundTemplateDirective],
  templateUrl: 'usuario-form.component.html'
})
export class UsuarioFormComponent extends FormComponent<Usuario, UsuarioRequest> implements OnInit {
  @Input() usuario?: Usuario | null;
  @Input() isDetalhes: boolean = false;
  unidades: Unidade[] = [];

  constructor(
    protected override fb: FormBuilder,
    protected override toastr: ToastrService,
    private unidadeService: UnidadeService,
  ) {
    super(fb, toastr);
    this.form = this.fb.group({
      nome: [null, Validators.required],
      email: [null, Validators.required],
      role: [null, Validators.required],
      unidade: [null, Validators.required],
    });
  }

  override ngOnInit() {
    this.carregarUnidades();

    if (this.usuario) {
      //this.form.patchValue(this.usuario);
    }
    if (this.isDetalhes) {

    }
  }

  private carregarUnidades() {
    this.unidadeService.listar().subscribe(
      response => {
        this.unidades = response.items;
      }
    );
  }

  protected readonly Role = Role;
  protected readonly Object = Object;
}
