import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { BackendService } from './backend/backend.service';

export interface Notificacao {
  id: number;
  titulo: string;
  mensagem: string;
  dataNotificacao: string;
  tipo?: string;
  lida: boolean;
  lidaEm?: string;
}

@Injectable({
  providedIn: 'root'
})
export class NotificationService {
  private readonly path = '/notificacoes';

  constructor(private backend: BackendService) {}

  listar(): Observable<Notificacao[]> {
    return this.backend.get<Notificacao[]>(this.path);
  }

  marcarComoLida(notificacaoId: number): Observable<void> {
    return this.backend.patch<void>(`${this.path}/${notificacaoId}/ler`, null);
  }
}
