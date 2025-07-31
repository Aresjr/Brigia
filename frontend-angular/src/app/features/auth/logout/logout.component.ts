import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AuthService } from '../auth.service';

@Component({
  selector: 'app-logout',
  template: '',
  standalone: true,
})
export class LogoutComponent implements OnInit {
  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit(): void {
    this.authService.logout().subscribe({
      next: () => {
        //localStorage.clear();
        this.router.navigate(['/login']);
      },
      error: () => {
        //localStorage.clear();
        this.router.navigate(['/login']);
      },
    });
  }
}

