import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';
import { AgendamentoDetalhes } from '../../features/agenda-diaria/agendamento.interface';
import { DatePipe } from '@angular/common';
import { AgendamentoService } from '../../features/agenda-diaria/agendamento.service';
import { LoadingSpinnerComponent } from '../../features/shared/loading/loading-spinner.component';

@Component({
  selector: 'app-detalhes-agendamento',
  imports: [
    FormsModule,
    LucideAngularModule,
    DatePipe,
    LoadingSpinnerComponent
],
  templateUrl: './detalhes-agendamento.component.html',
  styleUrl: './detalhes-agendamento.component.scss'
})
export class DetalhesAgendamentoComponent implements OnInit {

    token: string | null = null;
    agendamento: AgendamentoDetalhes | null = null;
    isLoading: boolean = false;
    agendamentoNaoEncontrado: boolean = false;

    constructor(private route: ActivatedRoute,
                private agendamentoService: AgendamentoService) {}

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
      console.log('cancelarAgendamento');
    }

    reagendarAgendamento() {
      console.log('reagendarAgendamento');
    }

    confirmarAgendamento() {
      console.log('confirmarAgendamento');
    }
}
