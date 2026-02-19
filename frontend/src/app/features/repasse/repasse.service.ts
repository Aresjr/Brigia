import { Injectable } from '@angular/core';
import { BaseService } from '../shared/base.service';
import { Repasse, RepasseRequest } from './repasse.interface';
import { Observable } from 'rxjs';
import { BackendService } from '../../core/backend/backend.service';
import { ToastrService } from 'ngx-toastr';
import { AuthService } from '../auth/auth.service';
@Injectable({
  providedIn: 'root'
})
export class RepasseService extends BaseService<Repasse, RepasseRequest> {
  override path = '/repasses';
  constructor(protected override backend: BackendService, 
              protected override toastr: ToastrService,
              protected override authService: AuthService) {
    super(backend, toastr, authService);
  }
  obterRepassesPorProfissional(profissionalId: number): Observable<Repasse[]> {
    return this.backend.get<Repasse[]>(`${this.path}/profissional/${profissionalId}`);
  }
}
