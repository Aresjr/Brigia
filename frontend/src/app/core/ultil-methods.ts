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
