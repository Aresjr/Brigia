import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Entidade } from '../../features/shared/entidade.interface';
import { UserService } from '../../core/user.service';

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

  showAddNovo: boolean = true;
  searchTerm: string = '';

  constructor(protected userService: UserService) {
    if (userService.isMedico()) {
      this.showAddNovo = false;
    }
  }

  onSearch($event: any): void {
    this.search.emit($event);
  }

  onAddNovo(): void {
    this.addNovo.emit();
  }

  onSelectItem($event: any) {
    this.selectRegistro.emit($event.target.value);
  }
}
