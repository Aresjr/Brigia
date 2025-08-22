import { Injectable } from '@angular/core';
import { catchError, Observable, shareReplay, throwError } from 'rxjs';
import { PacienteResponse, Paciente } from './paciente.interface';
import { BackendService } from '../../core/backend/backend.service';
import { ToastrService } from 'ngx-toastr';

@Injectable({
  providedIn: 'root'
})
export class PacienteService {
  constructor(private backend: BackendService, private toastr: ToastrService) { }

  path = '/pacientes';
  private cache$: Observable<PacienteResponse> | null = null;

  listar(): Observable<PacienteResponse> {
    if (!this.cache$) {
      this.cache$ = this.backend.get<PacienteResponse>(`${this.path}?size=999`).pipe(
        shareReplay(1),
        catchError((error) => {
          this.toastr.error('Erro ao carregar pacientes. Por favor, tente novamente.');
          return throwError(() => error);
        })
      );
    }
    return this.cache$;
  }

  criar(paciente: Partial<Paciente>): Observable<Paciente> {
    this.limparCache();
    return this.backend.post<Paciente>(this.path, paciente);
  }

  atualizar(id: number, paciente: Partial<Paciente>): Observable<Paciente> {
    this.limparCache();
    return this.backend.put<Paciente>(`${this.path}/${id}`, paciente);
  }

  limparCache() {
    this.cache$ = null;
  }
}
