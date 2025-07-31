import { Component } from '@angular/core';
import { Router, RouterOutlet, RouterModule, NavigationEnd, ActivatedRoute } from '@angular/router';
import { LucideAngularModule } from 'lucide-angular';
import { CommonModule } from '@angular/common';
import { MenuItemComponent } from "../../shared/menu-item/menu-item.component";
import { filter, map } from 'rxjs';
import { Title } from '@angular/platform-browser';
import { environment } from '../../../environments/environment';

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [RouterOutlet, LucideAngularModule, CommonModule, RouterModule, MenuItemComponent],
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
    this.redirectIfGetParam();

    const title = this.getDeepestChildTitle(this.route);
    this.updateTitle(title);

    this.router.events
      .pipe(
        filter(event => event instanceof NavigationEnd),
        map(() => this.getDeepestChildTitle(this.route))
      )
      .subscribe((title) => {
        this.updateTitle(title);
      });
  }

  pageTitle: string = '';
  submenuState: Record<string, boolean> = {};

  toggleSubmenu(menu: string) {
    this.submenuState[menu] = !this.submenuState[menu];
  }

  isSubmenuOpen(menu: string): boolean {
    return this.submenuState[menu] || false;
  }

  private getDeepestChildTitle(route: ActivatedRoute): string {
    let child = route.firstChild;
    while (child?.firstChild) {
      child = child.firstChild;
    }
    return child?.snapshot.data['title'];
  }

  private updateTitle(title: string) {
      this.pageTitle = title;
      this.titleService.setTitle(`${environment.clientName} | ${this.pageTitle}`);
  }

  private redirectIfGetParam() {
    const params = new URLSearchParams(window.location.search);
    const redirectRoute = params.get('route') || '';
    if (redirectRoute != '') {
      sessionStorage.setItem('redirect', redirectRoute);
    }
    const redirect = sessionStorage.getItem('redirect') || '';
    console.log('Redirecting to:', redirect);
    if (redirect) {
      sessionStorage.removeItem('redirect');
      this.router.navigate([redirect]);
      return;
    }
  }
}
