import { Component } from '@angular/core';
import {environment} from '../../../environments/environment';

@Component({
  selector: 'app-pacientes',
  imports: [],
  templateUrl: './pacientes.component.html',
  styleUrl: './pacientes.component.scss'
})
export class PacientesComponent {

  apiUrl = environment.apiUrl;

}
