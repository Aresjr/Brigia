import { Component } from '@angular/core';
import { ActivatedRoute, NavigationEnd, Router, RouterModule, RouterOutlet } from '@angular/router';
import { LucideAngularModule } from 'lucide-angular';
import { CommonModule } from '@angular/common';
import { MenuItemComponent } from '../menu-item/menu-item.component';
import { filter, map } from 'rxjs';
import { Title } from '@angular/platform-browser';
import { environment } from '../../../environments/environment';
import { FormsModule } from '@angular/forms';
import { Role } from '../../core/constans';
import { UserService } from '../../core/user.service';

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
    FormsModule
  ],
  templateUrl: './main-layout.component.html'
})
export class MainLayoutComponent {
  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private titleService: Title,
    private userService: UserService
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

    this.filterMenuItems();
  }

  submenuState: Record<string, boolean> = {};
  searchTerm: string = '';
  menuItems: MenuItem[] = [
    { label: 'Página Inicial', icon: 'home', route: '/', roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.MEDICO] },
    { label: 'Pacientes', icon: 'users', route: '/pacientes', roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.MEDICO] },
    { label: 'Agenda Diária', icon: 'calendar', route: '/agenda-diaria', roles: [Role.RECEPCIONISTA, Role.ADMIN, Role.MEDICO] },
    { label: 'Atendimentos', icon: 'stethoscope', route: '/atendimentos', roles: [Role.ADMIN, Role.MEDICO] },
    {
      label: 'Cadastros',
      icon: 'user-plus',
      hasSubmenu: true,
      children: [
        { label: 'Convênios', icon: 'heart-handshake', route: '/convenios', roles: [Role.RECEPCIONISTA, Role.FATURAMENTO, Role.ADMIN] },
        { label: 'Empresas', icon: 'building-2', route: '/empresas', roles: [Role.RECEPCIONISTA, Role.ADMIN] },
        { label: 'Especialidades', icon: 'microscope', route: '/especialidades', roles: [Role.RECEPCIONISTA, Role.FATURAMENTO, Role.ADMIN] },
        { label: 'Procedimentos', icon: 'clipboard-list', route: '/procedimentos', roles: [Role.RECEPCIONISTA, Role.FATURAMENTO, Role.ADMIN] },
        { label: 'Profissionais', icon: 'briefcase-medical', route: '/profissionais', roles: [Role.RECEPCIONISTA, Role.FATURAMENTO, Role.ADMIN] },
      ], roles: [Role.RECEPCIONISTA, Role.ADMIN]
    },
    {
      label: 'Faturamento',
      icon: 'receipt',
      hasSubmenu: true,
      children: [
        { label: 'Contas a Receber', icon: 'receipt-text', route: '/contas-receber', roles: [Role.FATURAMENTO, Role.ADMIN] }
      ], roles: [Role.FATURAMENTO, Role.ADMIN]
    }
  ];
  filteredMenuItems?: MenuItem[];

  filterMenuItems() {
    this.filteredMenuItems = this.menuItems.filter(menuItem => {
      return this.temAcessoMenu(menuItem);
    });
  }

  temAcessoMenu(menuItem: MenuItem) {
    return menuItem.roles.some(role => this.userService.getRoles().includes(role))
  }

  toggleSubmenu(menu: string) {
    this.submenuState[menu] = !this.submenuState[menu];
  }

  isSubmenuOpen(menu: string): boolean {
    return this.submenuState[menu] || false;
  }

  private getTitleFromRoute(route: ActivatedRoute): string {
    let child = route.firstChild;
    while (child?.firstChild) {
      child = child.firstChild;
    }
    return child?.snapshot.data['title'];
  }

  private updateTitle(title: string) {
      this.titleService.setTitle(`${environment.clientName} - ${title}`);
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
}
