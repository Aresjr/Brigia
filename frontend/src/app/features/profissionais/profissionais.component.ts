import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ProfissionalService } from './profissional.service';
import { Profissional } from './profissional.interface';
import { ProfissionalDetalhesComponent } from './profissional-detalhes/profissional-detalhes.component';
import { ProfissionalFormComponent } from './profissional-form/profissional-form.component';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
import { CelularPipe } from '../../core/pipes/celular.pipe';
import { BaseListComponent } from '../shared/base-list.component';
import { PaginationComponent } from '../shared/pagination/pagination.component';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';

@Component({
  selector: 'app-profissionais',
  imports: [
    CommonModule,
    ProfissionalDetalhesComponent,
    ProfissionalFormComponent,
    LucideAngularModule,
    FormsModule,
    CelularPipe,
    PaginationComponent,
    TopBarComponent,
    FabComponent
  ],
  templateUrl: './profissionais.component.html',
  standalone: true
})
export class ProfissionaisComponent extends BaseListComponent<Profissional> implements OnInit {
  override nomeEntidade = 'Profissional';

  constructor(private profissionalService: ProfissionalService, protected override toastr: ToastrService) {
    super(profissionalService, toastr);
  }

  override searchTermFilter(profissional: Profissional, searchTerm: string): boolean | undefined {
    return profissional.nome.toLowerCase().includes(searchTerm.toLowerCase()) ||
      profissional.celular?.includes(searchTerm) ||
      profissional.crm?.includes(searchTerm) ||
      profissional.email?.includes(searchTerm);
  }
}
