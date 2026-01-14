import {
  AfterContentInit,
  ChangeDetectorRef,
  Component,
  ElementRef, EventEmitter,
  Input,
  Output,
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
import { Agendamento, StatusAgendamento } from '../../agenda-diaria/agendamento.interface';

// Extend CalendarView with custom List view
export enum CustomCalendarView {
  Month = 'month',
  Week = 'week',
  Day = 'day',
  List = 'list'
}

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
export class CalendarioComponent implements AfterContentInit {
  @Input() events: CalendarEvent<Agendamento>[] = [];
  @Input() isLoading!: boolean;
  @Output() detalhesAgendamento = new EventEmitter<Agendamento>();
  @Output() detalhesDisponibilidade = new EventEmitter<any>();
  @Output() diaClicado = new EventEmitter<Date>();
  @Output() horarioClicado = new EventEmitter<Date>();
  @Output() dataAlterada = new EventEmitter<Date>();
  @Output() recarrega = new EventEmitter<void>();

  view: CustomCalendarView = CustomCalendarView.Week;
  CustomCalendarView = CustomCalendarView;
  currentDate: Date = new Date();
  hourSegments: number = 2;
  refresh = new Subject<void>();
  activeDayIsOpen: boolean = true;

  constructor(private elementRef: ElementRef, private renderer: Renderer2, private cdr: ChangeDetectorRef) {}

  dayClicked({ date, events }: { date: Date; events: CalendarEvent<Agendamento>[] }): void {
    if (this.isSameMonth(date, this.currentDate)) {
      this.activeDayIsOpen = !((this.isSameDay(this.currentDate, date) && this.activeDayIsOpen) || events.length === 0);
      this.currentDate = date;
    }
    this.diaClicado.emit(date);
  }

  verAgendamento(evento: CalendarEvent<Agendamento>): void {
    // Verificar se é um evento de disponibilidade (não tem paciente)
    if (evento.meta && !evento.meta.paciente) {
      this.detalhesDisponibilidade.emit(evento.meta);
    } else {
      this.detalhesAgendamento.emit(evento.meta);
    }
  }

  handleHour($event: { date: Date; sourceEvent: MouseEvent }) {
    this.horarioClicado.emit($event.date);
  }

  isSameMonth(date1: Date, date2: Date): boolean {
    return date1.getMonth() == date2.getMonth();
  }

  isSameDay(date1: Date, date2: Date) {
    return date1.getDate() == date2.getDate();
  }

  setView(view: CustomCalendarView) {
    this.view = view;
    this.cdr.detectChanges();
    //this.formatTimeLabels();
  }

  closeOpenMonthViewDay() {
    this.activeDayIsOpen = false;
    this.cdr.detectChanges();
    this.formatTimeLabels();
  }

  formatTimeLabels() {
    setTimeout(() => {
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
            hour = 0;
          }
          const formattedHour = hour.toString().padStart(2, '0');
          this.renderer.setProperty(label, 'textContent', `${formattedHour}:00`);
        }
      });
    }, 50);
  }

  ngAfterContentInit(): void {
    this.cdr.detectChanges();
    this.formatTimeLabels();
  }

  dateChanged() {
    this.dataAlterada.emit(this.currentDate);
  }

  recarregar() {
    this.recarrega.emit();
    this.formatTimeLabels();
  }

  getSortedEvents(): CalendarEvent<Agendamento>[] {
    return [...this.events].sort((a, b) => {
      const dateA = a.start ? new Date(a.start).getTime() : 0;
      const dateB = b.start ? new Date(b.start).getTime() : 0;
      return dateA - dateB;
    });
  }

  getEventTime(event: CalendarEvent<Agendamento>): string {
    if (!event.start) return '';
    const start = new Date(event.start);
    const end = event.end ? new Date(event.end) : null;
    const startTime = start.toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' });
    const endTime = end ? end.toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' }) : '';
    return endTime ? `${startTime} - ${endTime}` : startTime;
  }

  getEventDate(event: CalendarEvent<Agendamento>): string {
    if (!event.start) return '';
    return new Date(event.start).toLocaleDateString('pt-BR', {
      weekday: 'long',
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  }

  getStatusInfo(status: number) {
    return StatusAgendamento[status as keyof typeof StatusAgendamento] || { descricao: 'Desconhecido', cor: '#666' };
  }

  getCalendarView(): CalendarView {
    // Convert CustomCalendarView to CalendarView for angular-calendar directives
    switch (this.view) {
      case CustomCalendarView.Month:
        return CalendarView.Month;
      case CustomCalendarView.Week:
        return CalendarView.Week;
      case CustomCalendarView.Day:
        return CalendarView.Day;
      default:
        return CalendarView.Week;
    }
  }
}
