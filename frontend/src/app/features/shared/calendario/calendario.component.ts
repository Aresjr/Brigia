import {
  AfterViewInit,
  ChangeDetectorRef,
  Component,
  ElementRef,
  Input,
  OnInit,
  Renderer2
} from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  CalendarModule,
  CalendarEvent,
  CalendarView
} from 'angular-calendar';
import { Subject } from 'rxjs';
import { FormsModule } from '@angular/forms';
import { LucideAngularModule } from 'lucide-angular';

@Component({
  selector: 'app-calendario',
  standalone: true,
  imports: [
    CommonModule,
    CalendarModule,
    FormsModule,
    LucideAngularModule
  ],
  templateUrl: './calendario.component.html',
  styleUrl: 'calendario.component.css'
})
export class CalendarioComponent implements OnInit, AfterViewInit {
  @Input() events: CalendarEvent[] = [];

  view: CalendarView = CalendarView.Week;
  CalendarView = CalendarView;
  currentDate: Date = new Date();
  hourSegments: number = 2;
  refresh = new Subject<void>();
  activeDayIsOpen: boolean = true;

  constructor(private elementRef: ElementRef, private renderer: Renderer2, private cdr: ChangeDetectorRef) {}

  ngOnInit(): void {

  }

  dayClicked({ date, events }: { date: Date; events: CalendarEvent[] }): void {
    console.log('dayClicked');
    console.log(date);
    console.log(events);
    if (this.isSameMonth(date, this.currentDate)) {
      if ((this.isSameDay(this.currentDate, date) && this.activeDayIsOpen) || events.length === 0) {
        this.activeDayIsOpen = false;
      } else {
        this.activeDayIsOpen = true;
      }
      this.currentDate = date;
    }
  }

  verAgendamento(event: CalendarEvent): void {
    console.log(event);
  }

  handleHour($event: { date: Date; sourceEvent: MouseEvent }) {
    console.log('Clicou em um horário');
    console.log($event);
  }

  isSameMonth(date1: Date, date2: Date): boolean {
    return date1.getMonth() == date2.getMonth();
  }

  isSameDay(date1: Date, date2: Date) {
    return date1.getDate() == date2.getDate();
  }

  setView(view: CalendarView) {
    this.view = view;
    this.cdr.detectChanges();
    this.formatTimeLabels();
  }

  closeOpenMonthViewDay() {
    this.activeDayIsOpen = false;
    this.cdr.detectChanges();
    this.formatTimeLabels();
  }

  formatTimeLabels() {
    const timeLabels = this.elementRef.nativeElement.querySelectorAll('.cal-time');

    timeLabels.forEach((label: HTMLElement) => {
      let textContent = label.textContent || '';
      const timeMatch = textContent.match(/(\d+)\s*(am|pm)/i);

      if (timeMatch && timeMatch[1] && timeMatch[2]) {
        let hour = parseInt(timeMatch[1], 10);
        const ampm = timeMatch[2].toLowerCase();

        if (ampm === 'pm' && hour !== 12) {
          hour += 12;
        } else if (ampm === 'am' && hour === 12) {
          hour = 0; // 12 AM (meia-noite) é 00h
        }

        const formattedHour = hour.toString().padStart(2, '0');

        const newContent = `${formattedHour}:00`;
        this.renderer.setProperty(label, 'textContent', newContent);
      }
    });
  }

  ngAfterViewInit(): void {
    this.formatTimeLabels();
  }
}
