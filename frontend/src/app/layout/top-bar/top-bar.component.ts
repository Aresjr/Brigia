import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-top-bar',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule],
  templateUrl: './top-bar.component.html'
})
export class TopBarComponent {
  @Input() title: string = '';
  @Input() showSearchBar: boolean = true;
  @Output() search = new EventEmitter<void>();
  @Output() addNovo = new EventEmitter<void>();

  searchTerm: string = '';

  onSearch($event: any): void {
    this.search.emit($event);
  }

  onAddNovo(): void {
    this.addNovo.emit();
  }

  constructor() {}
}
