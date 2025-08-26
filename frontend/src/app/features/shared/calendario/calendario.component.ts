import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CalendarModule, CalendarEvent, CalendarView } from 'angular-calendar';
import { MonthViewDay } from 'calendar-utils';
import { startOfDay } from 'date-fns';

@Component({
  selector: 'app-calendario',
  standalone: true,
  imports: [
    CommonModule,
    CalendarModule,
  ],
  templateUrl: './calendario.component.html'
})
export class CalendarioComponent {
  view: CalendarView = CalendarView.Month; // inicia no mês
  CalendarView = CalendarView;

  viewDate: Date = new Date(); // dia atual

  events: CalendarEvent[] = [
    {
      start: startOfDay(new Date()),
      title: 'Evento de hoje',
      allDay: true,
    },
  ];

  setView(view: CalendarView) {
    this.view = view;
  }

  dayClicked({ day }: { day: MonthViewDay<any> }): void {
    this.viewDate = day.date;
    this.view = CalendarView.Day;
  }
}
