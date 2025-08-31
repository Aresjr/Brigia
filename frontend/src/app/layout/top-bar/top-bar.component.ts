import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgSelectComponent } from '@ng-select/ng-select';

@Component({
  selector: 'app-top-bar',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule, NgSelectComponent, ReactiveFormsModule],
  templateUrl: './top-bar.component.html'
})
export class TopBarComponent {
  @Input() title: string = '';
  @Input() showSearchBar: boolean = true;
  @Input() showDropdown: boolean = false;
  @Input() placeholderDropdown: string = '';
  @Input() registrosDropdown: any[] = [];
  @Output() search = new EventEmitter<void>();
  @Output() addNovo = new EventEmitter<void>();
  @Output() selectRegistro = new EventEmitter<any>();

  searchTerm: string = '';

  constructor() {}

  onSearch($event: any): void {
    this.search.emit($event);
  }

  onAddNovo(): void {
    this.addNovo.emit();
  }

  onSelectItem($event: any) {
    this.selectRegistro.emit($event);
  }
}
