import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
  CalendarModule,
  CalendarEvent,
  CalendarView,
  CalendarEventAction,
  CalendarEventTimesChangedEvent
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
export class CalendarioComponent implements OnInit {

  view: CalendarView = CalendarView.Week;

  CalendarView = CalendarView;

  currentDate: Date = new Date();
  hourSegments: number = 2;

  actions: CalendarEventAction[] = [
    {
      label: '<i class="fas fa-fw fa-trash-alt w-4 h-4 block"><lucide-icon name="pencil" class="block w-4 h-4"></lucide-icon></i>',
      a11yLabel: 'Editar',
      onClick: ({ event }: { event: CalendarEvent }): void => {
        this.handleEvent('Edited', event);
      },
    },
    {
      label: '<i class="fas fa-fw fa-trash-alt"></i>',
      a11yLabel: 'Delete',
      onClick: ({ event }: { event: CalendarEvent }): void => {
        this.events = this.events.filter((iEvent) => iEvent !== event);
        this.handleEvent('Deleted', event);
      },
    },
  ];

  refresh = new Subject<void>();

  events: CalendarEvent[] = [];

  activeDayIsOpen: boolean = true;

  ngOnInit(): void {
    let startDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 11);
    let endDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 13);
    this.events.push(
      {
        start: startDate,
        end: endDate,
        title: 'João da Silva - Ortopedista | Dr César',
        color: { primary: '#1e90ff', secondary: '#D1E8FF'},
        actions: this.actions,
        resizable: {
          beforeStart: true,
          afterEnd: true,
        },
        draggable: true,
      }
    );

    startDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12);
    endDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12, 30);
    this.events.push(
      {
        start: startDate,
        end: endDate,
        title: 'João da Silva - Ortopedista | Dr César',
        color: { primary: '#1e90ff', secondary: '#D1E8FF'},
        actions: this.actions,
        resizable: {
          beforeStart: true,
          afterEnd: true,
        },
        draggable: true,
      }
    );

    startDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12);
    endDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate(), 12, 45);
    this.events.push(
      {
        start: startDate,
        end: endDate,
        title: 'João da Silva - Ortopedista | Dr César',
        color: { primary: '#1e90ff', secondary: '#D1E8FF'},
        actions: this.actions,
        resizable: {
          beforeStart: true,
          afterEnd: true,
        },
        draggable: true,
      }
    );
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

  eventTimesChanged({event, newStart, newEnd}: CalendarEventTimesChangedEvent): void {
    this.events = this.events.map((iEvent) => {
      if (iEvent === event) {
        return {
          ...event,
          start: newStart,
          end: newEnd,
        };
      }
      return iEvent;
    });
    this.handleEvent('Dropped or resized', event);
  }

  handleEvent(action: string, event: CalendarEvent): void {

    console.log(event);
    console.log(action);

  }

  setView(view: CalendarView) {
    this.view = view;
  }

  closeOpenMonthViewDay() {
    this.activeDayIsOpen = false;
  }

  handleHour($event: { date: Date; sourceEvent: MouseEvent }) {
    console.log('Clicou em um horário');
    console.log($event);
  }

  isSameMonth(date1: Date, date2: Date): boolean {
    return date1.getMonth() == date2.getMonth();
  }

  private isSameDay(date1: Date, date2: Date) {
    return date1.getDate() == date2.getDate();
  }
}
