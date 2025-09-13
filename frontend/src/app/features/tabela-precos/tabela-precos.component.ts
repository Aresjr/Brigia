import { Component } from '@angular/core';
import { LucideAngularModule } from 'lucide-angular';
import { FabComponent } from '../shared/fab/fab.component';

@Component({
  selector: 'app-tabela-precos',
  imports: [
    LucideAngularModule,
    FabComponent
  ],
  templateUrl: './tabela-precos.component.html'
})
export class TabelaPrecosComponent {
}
