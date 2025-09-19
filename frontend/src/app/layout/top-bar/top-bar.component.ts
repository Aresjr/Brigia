import { Component, EventEmitter, Input, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { Entidade } from '../../features/shared/entidade.interface';
import { UserService } from '../../core/user.service';
import { NgNotFoundTemplateDirective, NgOptionComponent, NgSelectComponent } from '@ng-select/ng-select';
import { Usuario } from '../../features/auth/auth.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-top-bar',
  standalone: true,
  imports: [CommonModule, LucideAngularModule, FormsModule, ReactiveFormsModule, NgSelectComponent, NgNotFoundTemplateDirective, NgOptionComponent],
  templateUrl: './top-bar.component.html'
})
export class TopBarComponent {
  @Input() title: string = '';
  @Input() showSearchBar: boolean = true;
  @Input() showDropdown: boolean = false;
  @Input() placeholderDropdown: string = '';
  @Input() registrosDropdown: Entidade[] = [];
  @Output() search = new EventEmitter<void>();
  @Output() selectRegistro = new EventEmitter<any>();

  showAddNovo: boolean = true;
  searchTerm: string = '';
  usuario: Usuario | null;

  constructor(protected userService: UserService) {
    if (userService.isMedico()) {
      this.showAddNovo = false;
    }
    this.usuario = userService.getUser();
  }

  onSearch($event: any): void {
    this.search.emit($event);
  }

  onSelectItem(entidadeId: any) {
    this.selectRegistro.emit(entidadeId);
  }

  logout() {
    console.log('top-bar.logout');
    this.userService.logout().subscribe({
      next: value => {

        console.log('top-bar.success');
        localStorage.clear();
        //this.router.navigate(['/login']);
      },
      error: err => {
        console.log('top-bar.error');
        localStorage.clear();
      }
    });
  }
}
