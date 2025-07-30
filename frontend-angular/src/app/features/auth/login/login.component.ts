import { Component, OnInit } from '@angular/core';
import {
  FormBuilder,
  FormGroup,
  ReactiveFormsModule,
  Validators,
} from '@angular/forms';
import { CommonModule } from '@angular/common';
import { AuthService, LoginResponse } from '../auth.service';
import { Router } from '@angular/router';
import { ToastrService } from 'ngx-toastr';

@Component({
  selector: 'app-login',
  standalone: true,
  imports: [CommonModule, ReactiveFormsModule],
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss'],
})
export class LoginComponent implements OnInit {
  loginForm: FormGroup;

  constructor(
    private fb: FormBuilder,
    private authService: AuthService,
    private router: Router,
    private toastr: ToastrService
  ) {
    this.loginForm = this.fb.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required],
    });
  }

  ngOnInit(): void {}

  onSubmit(): void {
    if (this.loginForm.valid) {
      this.authService.login(this.loginForm.value).subscribe({
        next: (response) => {
          this.populateLocalStorage(response);
          this.toastr.success('Login realizado com sucesso!');
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

  populateLocalStorage(response: LoginResponse) {
    localStorage.setItem('email', response.email);
    localStorage.setItem('name', response.name);
    localStorage.setItem('avatarUrl', response.avatarUrl);
    localStorage.setItem('roles', JSON.stringify(response.roles));
    localStorage.setItem('unidade', response.unidade.toString());
  }
}
