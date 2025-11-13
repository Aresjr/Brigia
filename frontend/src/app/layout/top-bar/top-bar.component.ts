import { Component, EventEmitter, Input, OnDestroy, OnInit, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Entidade } from '../../features/shared/entidade.interface';
import { UserService } from '../../core/user.service';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { Usuario } from '../../features/auth/auth.service';
import { Router } from '@angular/router';
import { NotificationService, Notificacao } from '../../core/notification.service';
import { finalize, Subscription } from 'rxjs';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-top-bar',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule, ReactiveFormsModule, NgSelectComponent, NgNotFoundTemplateDirective, NgOptionComponent],
  templateUrl: './top-bar.component.html'
})
export class TopBarComponent implements OnInit, OnDestroy {
  @Input() title: string = '';
  @Input() showSearchBar: boolean = true;
  @Input() showDropdown: boolean = false;
  @Input() placeholderDropdown: string = '';
  @Input() registrosDropdown: Entidade[] = [];
  @Output() search = new EventEmitter<void>();
  @Output() selectRegistro = new EventEmitter<any>();

  showAddNovo: boolean = true;
  searchTerm: string = '';
  usuario: Usuario | null;
  notificacoes: Notificacao[] = [];
  notificacoesNaoLidas: number = 0;
  carregandoNotificacoes: boolean = false;
  erroNotificacoes: boolean = false;
  private notificacoesSub?: Subscription;

  constructor(protected userService: UserService,
              private router: Router,
              private notificationService: NotificationService,
              private toastr: ToastrService) {
    if (userService.isMedico()) {
      this.showAddNovo = false;
    }
    this.usuario = userService.getUser();
  }

  ngOnInit(): void {
    this.carregarNotificacoes();
  }

  ngOnDestroy(): void {
    this.notificacoesSub?.unsubscribe();
  }

  onSearch($event: any): void {
    this.search.emit($event);
  }

  onSelectItem(entidadeId: any) {
    this.selectRegistro.emit(entidadeId);
  }

  carregarNotificacoes(): void {
    this.erroNotificacoes = false;
    this.carregandoNotificacoes = true;
    this.notificacoesSub?.unsubscribe();
    this.notificacoesSub = this.notificationService
      .listar()
      .pipe(finalize(() => (this.carregandoNotificacoes = false)))
      .subscribe({
        next: (notificacoes) => {
          this.notificacoes = notificacoes ?? [];
          this.atualizarContagem();
        },
        error: () => {
          this.notificacoes = [];
          this.atualizarContagem();
          this.erroNotificacoes = true;
        }
      });
  }

  atualizarNotificacoes(event: Event): void {
    event.preventDefault();
    event.stopPropagation();
    this.carregarNotificacoes();
  }

  marcarComoLida(notificacao: Notificacao, event: Event): void {
    event.preventDefault();
    event.stopPropagation();
    if (notificacao.lida) {
      return;
    }

    this.notificationService.marcarComoLida(notificacao.id).subscribe({
      next: () => {
        notificacao.lida = true;
        notificacao.lidaEm = new Date().toISOString();
        this.atualizarContagem();
      },
      error: () => {
        this.toastr.error('Não foi possível marcar a notificação como lida.', 'Erro');
      }
    });
  }

  private atualizarContagem(): void {
    this.notificacoesNaoLidas = this.notificacoes.filter((notificacao) => !notificacao.lida).length;
  }

  logout() {
    this.userService.logout().subscribe({
      next: value => {
        localStorage.clear();
        this.router.navigateByUrl('/login');
      },
      error: err => {
        localStorage.clear();
        this.router.navigateByUrl('/login');
      }
    });
  }
}
