import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ConvenioService } from './convenio.service';
import { Convenio } from './convenio.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { ConvenioFormComponent } from './convenio-form/convenio-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';

@Component({
  selector: 'app-convenios',
  templateUrl: './convenios.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    ConvenioFormComponent,
    PaginationComponent,
    ConfirmDialogComponent,
    TopBarComponent,
    FabComponent
  ]
})
export class ConveniosComponent extends BaseListComponent<Convenio> implements OnInit {
  override nomeEntidade = 'Convênio';

  constructor(private convenioService: ConvenioService, protected override toastr: ToastrService) {
    super(convenioService, toastr);
  }

  override searchTermFilter(convenio: Convenio, searchTerm: string): boolean | undefined {
    return convenio.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      convenio.descricao?.toLowerCase().includes(searchTerm.toLowerCase());
  }
}
