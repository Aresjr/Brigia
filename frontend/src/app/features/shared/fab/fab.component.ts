import { Component, ElementRef, EventEmitter, HostListener, Input, Output } from '@angular/core';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-fab',
  imports: [
    LucideAngularModule
  ],
  templateUrl: './fab.component.html'
})
export class FabComponent {
  @Input() subButtons = false;
  @Output() clicked = new EventEmitter<void>();
  fabOpen: boolean = false;

  constructor(private eRef: ElementRef) {}

  toggle() {
    this.fabOpen = !this.fabOpen;
  }

  @HostListener('document:click', ['$event'])
  onClickOutside(event: MouseEvent) {
    if (this.fabOpen && !this.eRef.nativeElement.contains(event.target)) {
      this.fabOpen = false;
    }
  }

}
