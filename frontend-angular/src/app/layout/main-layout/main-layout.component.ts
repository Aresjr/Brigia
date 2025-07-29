import { Component } from '@angular/core';
import { Router, RouterOutlet, RouterModule } from '@angular/router';
import { LucideAngularModule } from 'lucide-angular';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [RouterOutlet, LucideAngularModule, CommonModule, RouterModule],
  templateUrl: './main-layout.component.html',
  styleUrl: './main-layout.component.scss'
})
export class MainLayoutComponent {
  isSubmenuOpen = false;

  constructor(private router: Router) {}

  isRouteActive(route: string): boolean {
    return this.router.isActive(route, {
      paths: 'exact',
      queryParams: 'exact',
      fragment: 'ignored',
      matrixParams: 'ignored'
    });
  }

  toggleSubmenu() {
    this.isSubmenuOpen = !this.isSubmenuOpen;
  }
}
