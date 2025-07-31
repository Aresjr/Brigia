import { Component } from '@angular/core';
import { Router, RouterOutlet, RouterModule, NavigationEnd, ActivatedRoute } from '@angular/router';
import { LucideAngularModule } from 'lucide-angular';
import { CommonModule } from '@angular/common';
import { MenuItemComponent } from "../menu-item/menu-item.component";
import { TopBarComponent } from "../top-bar/top-bar.component";
import { filter, map } from 'rxjs';
import { Title } from '@angular/platform-browser';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [
    RouterOutlet,
    LucideAngularModule,
    CommonModule,
    RouterModule,
    MenuItemComponent,
    TopBarComponent
  ],
  templateUrl: './main-layout.component.html',
  styleUrl: './main-layout.component.scss'
})
export class MainLayoutComponent {
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private titleService: Title
  ) { }

  ngOnInit() {
    const title = this.getDeepestChildTitle(this.route);
    this.updateTitle(title);

    this.router.events
      .pipe(
        filter(event => event instanceof NavigationEnd),
        map(() => this.getDeepestChildTitle(this.route))
      )
      .subscribe((title) => this.updateTitle(title));

    this.loggedUserName = localStorage.getItem('name') || '';
  }

  submenuState: Record<string, boolean> = {};
  loggedUserName: string = '';
  isUserMenuOpen = false;

  toggleSubmenu(menu: string) {
    this.submenuState[menu] = !this.submenuState[menu];
  }

  isSubmenuOpen(menu: string): boolean {
    return this.submenuState[menu] || false;
  }

  toggleUserMenu() {
    this.isUserMenuOpen = !this.isUserMenuOpen;
  }

  private getDeepestChildTitle(route: ActivatedRoute): string {
    let child = route.firstChild;
    while (child?.firstChild) {
      child = child.firstChild;
    }
    return child?.snapshot.data['title'];
  }

  private updateTitle(title: string) {
      this.titleService.setTitle(`${environment.clientName} | ${title}`);
  }
}
