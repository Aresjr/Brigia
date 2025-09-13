import { Component } from '@angular/core';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-tabela-precos',
  imports: [
    LucideAngularModule
  ],
  templateUrl: './tabela-precos.component.html'
})
export class TabelaPrecosComponent {
  fabOpen: boolean = false;
}
