import { Component, ElementRef, EventEmitter, Input, OnInit, Output, ViewChild } from '@angular/core';
import Calendar from '@toast-ui/calendar';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-calendario',
  templateUrl: './calendario.component.html',
  imports: [
    DatePipe
  ]
})
export class CalendarioComponent implements OnInit {
  @ViewChild('calendar', { static: true }) calendarEl!: ElementRef;
  calendar!: typeof Calendar;
  currentDate = new Date();

  ngOnInit() {
    this.calendar = new Calendar(this.calendarEl.nativeElement, {
      defaultView: 'day',
      taskView: false,
      scheduleView: false,
      useDetailPopup: true,
      useFormPopup: true,
      calendars: [
        { id: '1', name: 'Consultas', backgroundColor: '#03a9f4' },
        { id: '2', name: 'Retornos', backgroundColor: '#f44336' }
      ],
      timezone: { zones: [{ timezoneName: 'America/Sao_Paulo' }] }
    });

    this.calendar.createEvents([
      {
        id: '1',
        calendarId: '1',
        title: 'Consulta - João',
        start: '2025-08-25T09:00:00',
        end: '2025-08-25T10:00:00',
        category: 'time'
      },
      {
        id: '2',
        calendarId: '2',
        title: 'Retorno - Maria',
        start: '2025-08-25T11:00:00',
        end: '2025-08-25T11:30:00',
        category: 'time'
      }
    ]);
  }

  setToday() {
    this.calendar.today();
  }

  movePrev() {
    this.calendar.prev();
  }

  moveNext() {
    this.calendar.next();
    console.log(this.calendar);
    console.log(this.calendar.getDate());
  }

  changeView(view: 'day' | 'week' | 'month') {
    this.calendar.changeView(view);
  }

  getCurrentDate() {
    return this.calendar.getDate();
  }
}
