import { AbstractControl } from '@angular/forms';

export function toggleNumber(control: AbstractControl<any>, value: number) {
  let arr: any[] = control?.value || [];
  const index = arr.indexOf(value);
  if (index > -1) {
    control.setValue(arr.filter(n => n !== value));
  } else {
    control.setValue([...arr, value]);
  }
}

export function limitLength(event: Event): void {
  const inputElement = event.target as HTMLInputElement;
  const maxLength = parseInt(inputElement.getAttribute('maxlength') || '0', 10);

  if (maxLength > 0 && inputElement.value.length > maxLength) {
    inputElement.value = inputElement.value.slice(0, maxLength);
  }
}

export function autoResize(event: any) {
  const textarea = event.target;
  textarea.style.height = 'auto';
  textarea.style.height = textarea.scrollHeight + 'px';
}

export function formatHora(date: Date): string {
  return date.toLocaleTimeString('pt', {
    hour: '2-digit',
    minute: '2-digit',
    hour12: false
  });
}

export function isDataNoFuturo(data: string, hora: string): boolean {
  const [ano, mes, diaNum] = data.split('-').map(Number);
  const [h, m] = hora.split(':').map(Number);
  const agendamento = new Date(ano, mes - 1, diaNum, h, m, 0, 0);
  const agora = new Date();
  return agendamento.getTime() > agora.getTime();
}


export function abrirDatePicker(input: HTMLInputElement) {
  if (input.showPicker != undefined) {
    input.showPicker();
  }
  input.focus();
}

// Converte data de yyyy-MM-dd para dd/mm/yyyy
export function formatDateToBR(date: string | null): string | null {
  if (!date) return null;
  const [year, month, day] = date.split('-');
  return `${day}/${month}/${year}`;
}

// Converte data de dd/mm/yyyy para yyyy-MM-dd
export function formatDateFromBR(date: string | null): string | null {
  if (!date) return null;
  const parts = date.split('/');
  if (parts.length !== 3) return null;
  const [day, month, year] = parts;
  return `${year}-${month}-${day}`;
}

