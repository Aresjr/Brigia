import { Component, ElementRef, EventEmitter, HostListener, Input, Output } from '@angular/core';
import { LucideAngularModule } from 'lucide-angular';
import { NgIf } from '@angular/common';

@Component({
  selector: 'app-fab',
  imports: [
    LucideAngularModule,
    NgIf
  ],
  templateUrl: './fab.component.html'
})
export class FabComponent {
  @Input() tituloBotao1: string | null = null;
  @Input() tituloBotao2: string | null = null;
  @Output() clicked = new EventEmitter<void>();
  @Output() clickedBotao1 = new EventEmitter<void>();
  @Output() clickedBotao2 = new EventEmitter<void>();
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
