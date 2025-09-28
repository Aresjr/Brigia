import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { NgIf } from '@angular/common';
import { LoadingSpinnerComponent } from '../../shared/loading/loading-spinner.component';
import { AuthService } from '../auth.service';
import { UsuarioService } from '../../usuarios/usuario.service';

@Component({
  selector: 'app-cadastrar-senha',
  imports: [
    FormsModule,
    NgIf,
    LoadingSpinnerComponent
  ],
  standalone: true,
  templateUrl: './cadastrar-senha.component.html',
  styleUrl: './cadastrar-senha.component.scss'
})
export class CadastrarSenhaComponent implements OnInit {
    token: string | null = null;
    senha: string = '';
    isLoading: boolean = false;
    tokenInvalido: boolean = false;
    sucessoCadastro: boolean = false;

    constructor(
        private route: ActivatedRoute,
        private authService: AuthService,
        private usuarioService: UsuarioService
    ) {}

    ngOnInit(): void {
        this.token = this.route.snapshot.queryParamMap.get('token');
        if (!this.token) {
            this.tokenInvalido = true;
        } else {
          this.isLoading = true;
          this.usuarioService.getByToken(this.token).subscribe({
            next: () => {
              this.isLoading = false;
            },
            error: () => {
              this.tokenInvalido = true;
              this.isLoading = false;
            }
          });
        }
    }

    salvarSenha() {
        if (!this.token || !this.senha) return;

        this.isLoading = true;
        this.authService.cadastrarSenha(this.token, this.senha).subscribe({
            next: () => {
                this.sucessoCadastro = true;
                this.isLoading = false;
            },
            error: () => {
                this.tokenInvalido = true;
                this.isLoading = false;
            }
        });
    }
}
