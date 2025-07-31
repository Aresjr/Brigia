import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { Router, RouterLinkActive, NavigationEnd  } from '@angular/router';
import { LucideAngularModule } from 'lucide-angular';
import { filter } from 'rxjs/operators';

@Component({
  selector: 'app-menu-item',
  imports: [RouterLinkActive, LucideAngularModule, CommonModule],
  templateUrl: './menu-item.component.html'
})
export class MenuItemComponent {
  constructor(private router: Router) {
    this.router.events
      .pipe(filter(event => event instanceof NavigationEnd))
      .subscribe(() => {
        this.isActive = this.route ? this.router.url === this.route : false;
      });
  }

  isActive = false;
  @Input() label!: string;
  @Input() route?: string;
  @Input() roles?: string[];
  @Input() icon?: string;
  @Input() hasSubmenu?: boolean = false;
  @Input() submenuOpen = false;
  @Output() clicked = new EventEmitter<void>();

  handleClick() {
    this.clicked.emit();
    if (this.route) {
      this.router.navigate([this.route]);
    }
  }

}
