import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Entidade } from '../../features/shared/entidade.interface';

@Component({
  selector: 'app-top-bar',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule, ReactiveFormsModule],
  templateUrl: './top-bar.component.html'
})
export class TopBarComponent {
  @Input() title: string = '';
  @Input() showSearchBar: boolean = true;
  @Input() showDropdown: boolean = false;
  @Input() placeholderDropdown: string = '';
  @Input() registrosDropdown: Entidade[] = [];
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
    console.log('onSelectItem', $event);
    console.log('onSelectItem', $event.target.value);
    this.selectRegistro.emit($event.target.value);
  }
}
