import { Component } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { CommonModule } from '@angular/common';
import { AuthService } from '../auth.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';
import { LucideAngularModule } from 'lucide-angular';
import { UserService } from '../../../core/user.service';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule, LucideAngularModule],
  templateUrl: './login.component.html',
})
export class LoginComponent {
  loginForm: FormGroup;

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router,
    private toastr: ToastrService,
    private userService: UserService
  ) {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required],
    });
  }

  onSubmit(): void {
    if (this.loginForm.valid) {
      this.authService.login(this.loginForm.value).subscribe({
        next: (response) => {
          this.userService.setUser(response);
          this.router.navigate(['/']);
        },
        error: (error) => {
          console.error('Login failed:', error);
          let errorMessage = 'Erro ao fazer login. Por favor, tente novamente.';

          if (error.status === 401) {
            errorMessage = 'Email ou senha inválidos.';
          } else if (error.status === 403) {
            errorMessage = 'Acesso não autorizado.';
          } else if (error.error?.message) {
            errorMessage = error.error.message;
          }

          this.toastr.error(errorMessage);
        },
      });
    } else {
      this.toastr.error('Por favor, preencha todos os campos corretamente.');
    }
  }
}
