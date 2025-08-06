import { Component } from '@angular/core';
import { ActivatedRoute, Data, NavigationEnd, Route, Router, RouterModule, RouterOutlet } from '@angular/router';
import { LucideAngularModule } from 'lucide-angular';
import { CommonModule } from '@angular/common';
import { MenuItemComponent } from '../menu-item/menu-item.component';
import { TopBarComponent } from '../top-bar/top-bar.component';
import { filter, map } from 'rxjs';
import { Title } from '@angular/platform-browser';
import { environment } from '../../../environments/environment';
import { FormsModule } from '@angular/forms';
import { Role } from '../../core/constans';
import { routes } from '../../app.routes';

interface MenuItem {
  label: string;
  icon: string;
  route?: string;
  hasSubmenu?: boolean;
  children?: MenuItem[];
  roles: Role[];
}

@Component({
  selector: 'app-main-layout',
  standalone: true,
  imports: [
    RouterOutlet,
    LucideAngularModule,
    CommonModule,
    RouterModule,
    MenuItemComponent,
    TopBarComponent,
    FormsModule
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
    const title = this.getTitleFromRoute(this.route);
    this.updateTitle(title);

    this.router.events
      .pipe(
        filter(event => event instanceof NavigationEnd),
        map(() => this.getTitleFromRoute(this.route))
      )
      .subscribe((title) => this.updateTitle(title));

    this.populateRoles();
    this.populateMenus();
    this.filterMenuItems();

    this.loggedUserName = localStorage.getItem('name') || '';
  }

  submenuState: Record<string, boolean> = {};
  loggedUserName: string = '';
  isUserMenuOpen = false;
  searchTerm: string = '';
  userRoles: Role[] = [];
  menuItems: MenuItem[] = [];
  filteredMenuItems?: MenuItem[];

  filterMenuItems() {
    this.filteredMenuItems = this.menuItems.filter(menuItem => {
      return menuItem.roles.some(role => this.userRoles.includes(role));
    });
  }

  toggleSubmenu(menu: string) {
    this.submenuState[menu] = !this.submenuState[menu];
  }

  isSubmenuOpen(menu: string): boolean {
    return this.submenuState[menu] || false;
  }

  toggleUserMenu() {
    this.isUserMenuOpen = !this.isUserMenuOpen;
  }

  private getTitleFromRoute(route: ActivatedRoute): string {
    let child = route.firstChild;
    while (child?.firstChild) {
      child = child.firstChild;
    }
    return child?.snapshot.data['title'];
  }

  private updateTitle(title: string) {
      this.titleService.setTitle(`${environment.clientName} | ${title}`);
  }

  onSearchChange() {
    if (!this.searchTerm){
      this.filteredMenuItems = this.menuItems;
      return;
    }

    const search = this.searchTerm.toLowerCase();
    this.filteredMenuItems = this.menuItems.map(item => {
      if (item.children) {
        const filteredChildren = item.children.filter(child =>
          child.label.toLowerCase().includes(search)
        );
        if (filteredChildren.length > 0) {
          if (!this.submenuState[item.label]) {
            this.toggleSubmenu(item.label);
          }
          return { ...item, children: filteredChildren };
        }
      }
      if (item.label.toLowerCase().includes(search)) {
        return item;
      }
      return null;
    }).filter((item): item is MenuItem => item !== null);
  }

  private populateRoles() {
    const roles = JSON.parse(localStorage.getItem('roles') || '[]');
    roles.forEach((role: string) => {
      this.userRoles.push(Role[role as keyof typeof Role] as Role);
    });
  }

  private populateMenus() {
    routes.forEach(route => {
      if (route.path == '' && route.children) {
        route.children.forEach((item) => {
          if (item.data) {
            const menu: MenuItem | undefined = this.createMenu(item.path, item.data);
            if (menu) {
              if (menu.hasSubmenu) {
                item.children?.forEach(sub => {
                  const submenu: MenuItem | undefined = this.createMenu(sub.path, sub.data);
                  if (submenu) {
                    menu.children?.push(submenu);
                  }
                });
              }
              this.menuItems.push(menu);
            }
          }
        });
      }
    });
  }

  private createMenu(path: string | undefined, data: Data | undefined): MenuItem | undefined {
    if (!data) {
      return undefined;
    }
    return {
      label: data['title'],
      icon: data['icon'],
      route: path,
      hasSubmenu: data['hasSubmenu'] || false,
      children: [],
      roles: data['roles']
    };
  }
}
