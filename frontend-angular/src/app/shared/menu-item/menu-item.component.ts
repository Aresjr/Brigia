import { NgClass } from '@angular/common';
import { Component, Input } from '@angular/core';
import { RouterLink, RouterLinkActive } from '@angular/router';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-menu-item',
  imports: [RouterLink, RouterLinkActive, NgClass, LucideAngularModule],
  templateUrl: './menu-item.component.html',
  styleUrl: './menu-item.component.scss'
})
export class MenuItemComponent {
  @Input() label!: string;
  @Input() route!: string;
  @Input() icon?: string;
}
