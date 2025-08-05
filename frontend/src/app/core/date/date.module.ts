import { NgModule } from '@angular/core';
import { MatNativeDateModule } from '@angular/material/core';
import { MatDatepickerModule } from '@angular/material/datepicker';

@NgModule({
  imports: [
    MatDatepickerModule,
    MatNativeDateModule,
  ],
  exports: [
    MatDatepickerModule,
    MatNativeDateModule,
  ],
  providers: []
})
export class DateModule { }
