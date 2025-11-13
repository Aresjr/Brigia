import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { AgendamentoDetalhes } from '../../features/agenda-diaria/agendamento.interface';
import { DatePipe, NgIf } from '@angular/common';
import { AgendamentoService } from '../../features/agenda-diaria/agendamento.service';
import { LoadingSpinnerComponent } from '../../features/shared/loading/loading-spinner.component';
import { ConfirmDialogComponent } from '../../features/shared/confirm-dialog/confirm-dialog.component';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-detalhes-agendamento',
  imports: [
    FormsModule,
    LucideAngularModule,
    DatePipe,
    NgIf,
    LoadingSpinnerComponent,
    ConfirmDialogComponent
  ],
  templateUrl: './detalhes-agendamento.component.html',
  styleUrl: './detalhes-agendamento.component.scss'
})
export class DetalhesAgendamentoComponent implements OnInit {

    token: string | null = null;
    agendamento: AgendamentoDetalhes | null = null;
    isLoading: boolean = false;
    agendamentoNaoEncontrado: boolean = false;
    exibeConfirmCancelamento: boolean = false;
    agendamentoCancelado: boolean = false;

    constructor(private route: ActivatedRoute,
                private router: Router,
                private agendamentoService: AgendamentoService,
                private toastr: ToastrService) {}

    ngOnInit(): void {
        this.isLoading = true;
        this.token = this.route.snapshot.queryParamMap.get('token');
        if (this.token) {
          this.agendamentoService.getByToken(this.token).subscribe({
            next: agendamento => {
              this.agendamento = agendamento;
              this.isLoading = false;
            },
            error: () => {
              this.agendamentoNaoEncontrado = true;
              this.isLoading = false;
            }
          });
        }
    }

    cancelarAgendamento() {
      this.exibeConfirmCancelamento = true;
    }

    confirmarCancelamento() {
      if (this.token) {
        this.isLoading = true;
        this.agendamentoService.cancelarPorToken(this.token).subscribe({
          next: () => {
            this.toastr.success('Agendamento cancelado com sucesso');
            this.agendamentoCancelado = true;
            this.exibeConfirmCancelamento = false;
            this.isLoading = false;
          },
          error: () => {
            this.exibeConfirmCancelamento = false;
            this.isLoading = false;
          }
        });
      }
    }

    cancelarConfirmacao() {
      this.exibeConfirmCancelamento = false;
    }

    reagendarAgendamento() {
      console.log('reagendarAgendamento');
    }

    confirmarAgendamento() {
      console.log('confirmarAgendamento');
    }
}
