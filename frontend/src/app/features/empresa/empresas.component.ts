import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { EmpresaService } from './empresa.service';
import { Empresa } from './empresa.interface';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { EmpresaFormComponent } from './empresa-form/empresa-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { ConfirmDialogComponent } from '../shared/confirm-dialog/confirm-dialog.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { ColorUtils } from '../../core/color-utils';
import { FabComponent } from '../shared/fab/fab.component';
import { CnpjPipe } from '../../core/pipes/cnpj.pipe';

@Component({
  selector: 'app-empresas',
  templateUrl: './empresas.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    FormsModule,
    EmpresaFormComponent,
    PaginationComponent,
    ConfirmDialogComponent,
    TopBarComponent,
    FabComponent,
    CnpjPipe
  ]
})
export class EmpresasComponent extends BaseListComponent<Empresa> {
  override nomeEntidade = 'Empresa';

  constructor(private empresaService: EmpresaService, protected override toastr: ToastrService) {
    super(empresaService, toastr);
  }

  override searchTermFilter(empresa: Empresa, searchTerm: string): boolean | undefined {
    return empresa.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      empresa.observacao?.toLowerCase().includes(searchTerm.toLowerCase());
  }

  protected readonly ColorUtils = ColorUtils;
}
