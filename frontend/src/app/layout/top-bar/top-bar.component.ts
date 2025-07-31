import { Component, EventEmitter, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { ActivatedRoute, Data, NavigationEnd, Router } from '@angular/router';
import { filter, map } from 'rxjs';

@Component({
  selector: 'app-top-bar',
  standalone: true,
  imports: [CommonModule, LucideAngularModule],
  templateUrl: './top-bar.component.html'
})
export class TopBarComponent {
  @Output() addButtonClick = new EventEmitter<void>();
  @Output() search = new EventEmitter<void>();

  pageTitle: string = '';
  showSearch: boolean = false;
  showAddButton: boolean = false;

  constructor(private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    const child = this.getDeepestChild(this.route);
    if (child) {
      this.pageTitle = child['title'];
    }

    this.router.events
      .pipe(
        filter(event => event instanceof NavigationEnd),
        map(() => this.getDeepestChild(this.route))
      )
      .subscribe((data) => {
        if (data) {
          this.pageTitle = data['title'];
          this.showSearch = data['showSearch'];
          this.showAddButton = data['showAddButton'];
        }
      });
  }

  private getDeepestChild(route: ActivatedRoute): Data | undefined {
    let child = route.firstChild;
    while (child?.firstChild) {
      child = child.firstChild;
    }
    return child?.snapshot.data;
  }

  onAddClick() {
    this.addButtonClick.emit();
  }

  onSearch() {
    this.search.emit();
  }
}
