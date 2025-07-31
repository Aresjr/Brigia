import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../../environments/environment';
import { PacienteResponse } from './paciente.interface';

@Injectable({
  providedIn: 'root'
})
export class PacientesService {
  constructor(private http: HttpClient) {}

  listarPacientes(): Observable<PacienteResponse> {
    return this.http.get<PacienteResponse>(`${environment.apiUrl}/pacientes`, { withCredentials: true });
  }
}
