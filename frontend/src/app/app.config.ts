import { ApplicationConfig, provideZoneChangeDetection, importProvidersFrom } from '@angular/core';
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';
import { provideHttpClient } from '@angular/common/http';
import { provideAnimations } from '@angular/platform-browser/animations';
import { provideToastr } from 'ngx-toastr';
import { LucideAngularModule } from 'lucide-angular';
import { Home, User, Calendar, LogIn, UserPlus, Stethoscope, ChevronRight, MessageSquare,
  MessageCircle, CircleUser, ChevronFirst, Users, Search, ClipboardList, Building, ChevronDown,
  ArrowDownIcon, ArrowUpIcon, ArrowUpDownIcon, Plus, ChevronLeft, HeartHandshake, Receipt, Mail, Lock, Building2,
  Microscope, Menu, EllipsisVertical, X, Pencil, Trash
 } from 'lucide-angular/src/icons';
import { provideNgxMask } from 'ngx-mask';
import {
  CalendarModule,
  CalendarUtils,
  DateAdapter
} from 'angular-calendar';
import { adapterFactory } from 'angular-calendar/date-adapters/moment';
import moment from 'moment';
import localePt from '@angular/common/locales/pt';
import { registerLocaleData } from '@angular/common';

registerLocaleData(localePt);
moment.locale('pt-br');
moment.updateLocale('pt-br', {
  longDateFormat: {
    LT: 'HH:mm', // usado para horários curtos
    LTS: 'HH:mm:ss',
    L: '',
    LL: '',
    LLL: '',
    LLLL: ''
  }
});

export function momentAdapterFactory() {
  return adapterFactory(moment);
}

export const appConfig: ApplicationConfig = {
  providers: [
    provideHttpClient(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideAnimations(),
    provideToastr({
      timeOut: 7000,
      positionClass: 'toast-top-right',
      preventDuplicates: true,
      progressBar: true,
      closeButton: true,
      tapToDismiss: true
    }),
    importProvidersFrom(
      LucideAngularModule.pick({ Home, User, Calendar, LogIn, UserPlus, Stethoscope, ChevronRight,
        MessageSquare, MessageCircle, CircleUser, ChevronFirst, Users, Search, ClipboardList,
        Building, ChevronDown, ArrowDownIcon, ArrowUpIcon, ArrowUpDownIcon, Plus, ChevronLeft,
        HeartHandshake, Receipt, Mail, Lock, Building2, Microscope, Menu, EllipsisVertical, X, Pencil, Trash
       }),
      CalendarModule.forRoot({
          provide: DateAdapter,
          useFactory: momentAdapterFactory
        }
      )
    ),
    provideNgxMask(),
    CalendarUtils
  ]
};
