import { Component, EventEmitter, Output } from '@angular/core';
import { CommonModule } from '@angular/common';
import { LucideAngularModule } from 'lucide-angular';
import { ActivatedRoute, NavigationEnd, Router } from '@angular/router';
import { filter, map } from 'rxjs';

@Component({
  selector: 'app-top-bar',
  standalone: true,
  imports: [CommonModule, LucideAngularModule],
  templateUrl: './top-bar.component.html'
})
export class TopBarComponent {
  @Output() addButtonClick = new EventEmitter<void>();

  pageTitle: string = '';

  constructor(private router: Router, private route: ActivatedRoute) { }

  ngOnInit() {
    this.pageTitle = this.getTitleFromRoute(this.route);

    this.router.events
      .pipe(
        filter(event => event instanceof NavigationEnd),
        map(() => this.getTitleFromRoute(this.route))
      )
      .subscribe((title) => this.pageTitle = title);
  }

  private getTitleFromRoute(route: ActivatedRoute): string {
    let child = route.firstChild;
    while (child?.firstChild) {
      child = child.firstChild;
    }
    return child?.snapshot.data['title'];
  }
}
