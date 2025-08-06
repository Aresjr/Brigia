import { Component } from '@angular/core';
import { Router, RouterOutlet, RouterModule, NavigationEnd, ActivatedRoute } from '@angular/router';
import { LucideAngularModule } from 'lucide-angular';
import { CommonModule } from '@angular/common';
import { MenuItemComponent } from "../menu-item/menu-item.component";
import { TopBarComponent } from "../top-bar/top-bar.component";
import { filter, map } from 'rxjs';
import { Title } from '@angular/platform-browser';
import { environment } from '../../../environments/environment';
import { FormsModule } from '@angular/forms';

interface MenuItem {
  label: string;
  icon: string;
  route?: string;
  hasSubmenu?: boolean;
  children?: MenuItem[];
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
  searchTerm: string = '';
  menuItems: MenuItem[] = [
    { label: 'Página Inicial', icon: 'home', route: '/' },
    { label: 'Pacientes', icon: 'users', route: '/pacientes' },
    { label: 'Agendamentos', icon: 'calendar', route: '/agendamentos' },
    {
      label: 'Cadastros',
      icon: 'user-plus',
      hasSubmenu: true,
      children: [
        { label: 'Convênios', icon: 'heart-handshake', route: '/convenios' },
        { label: 'Profissionais', icon: 'stethoscope', route: '/profissionais' },
        { label: 'Procedimentos', icon: 'clipboard-list', route: '/procedimentos' },
      ]
    },
    {
      label: 'Faturamento',
      icon: 'receipt',
      hasSubmenu: true,
      children: [
        { label: 'Tabela de Preços', icon: 'receipt', route: '/tabela-precos' }
      ]
    }
  ];
  filteredMenuItems: MenuItem[] = this.menuItems;

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
