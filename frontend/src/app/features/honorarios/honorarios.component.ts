import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { Honorario } from './honorario.interface';
import { HonorarioService } from './honorario.service';
import { HonorariosFormComponent } from './honorarios-form.component';
import { BaseListComponent } from '../shared/base-list.component';
import { ToastrService } from 'ngx-toastr';
import { TopBarComponent } from '../../layout/top-bar/top-bar.component';
import { FabComponent } from '../shared/fab/fab.component';

@Component({
  selector: 'app-honorarios',
  templateUrl: './honorarios.component.html',
  standalone: true,
  imports: [
    CommonModule,
    LucideAngularModule,
    HonorariosFormComponent,
    TopBarComponent,
    FabComponent
  ]
})
export class HonorariosComponent extends BaseListComponent<Honorario> implements OnInit {

  constructor(
    private honorarioService: HonorarioService,
    protected override toastr: ToastrService
  ) {
    super(honorarioService, toastr);
  }

  override searchTermFilter(honorario: Honorario, searchTerm: string): boolean | undefined {
    return honorario.profissional.nome.toLowerCase().includes(searchTerm.toLowerCase());
  }
}
