import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { UsuarioService } from './usuario.service';
import { Usuario, UsuarioRequest } from './usuario.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';
import { UsuarioFormComponent } from './usuario-form/usuario-form.component';

@Component({
  selector: 'app-usuarios',
  templateUrl: './usuarios.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    PaginationComponent,
    ConfirmDialogComponent,
    TopBarComponent,
    FabComponent,
    UsuarioFormComponent
  ]
})
export class UsuariosComponent extends BaseListComponent<Usuario> implements OnInit {
  override nomeEntidade = 'Usuário';

  constructor(private usuarioService: UsuarioService, protected override toastr: ToastrService) {
    super(usuarioService, toastr);
  }

  cadastraUsuarioNovo(usuarioNovo: Partial<UsuarioRequest>) {
    console.log('cadastraUsuarioNovo', usuarioNovo);
  }
}
