import { ApplicationConfig, provideZoneChangeDetection, importProvidersFrom, LOCALE_ID } from '@angular/core';
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';
import { HTTP_INTERCEPTORS, provideHttpClient, withInterceptorsFromDi } from '@angular/common/http';
import { provideAnimations } from '@angular/platform-browser/animations';
import { provideToastr } from 'ngx-toastr';
import { LucideAngularModule } from 'lucide-angular';
import { Home, User, Calendar, LogIn, UserPlus, Stethoscope, ChevronRight, MessageSquare, DollarSign,
  MessageCircle, CircleUser, ChevronFirst, Users, Search, ClipboardList, Building, ChevronDown, BanknoteArrowUp,
  ArrowDownIcon, ArrowUpIcon, ArrowUpDownIcon, Plus, ChevronLeft, HeartHandshake, Receipt, Mail, Lock, Building2,
  Microscope, Menu, EllipsisVertical, X, Pencil, Trash, BriefcaseMedical, ReceiptText, RefreshCw, Calculator,
  CalendarPlus, CalendarCheck, HandCoins, FileHeart, Check, Printer, History, Eye, FileText
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
import { NgApexchartsModule } from 'ng-apexcharts';
import { AuthInterceptor } from './core/guards/auth.interceptor';

registerLocaleData(localePt);

export function momentAdapterFactory() {
  return adapterFactory(moment);
}

export const appConfig: ApplicationConfig = {
  providers: [
    provideHttpClient(withInterceptorsFromDi()),
    { provide: HTTP_INTERCEPTORS, useClass: AuthInterceptor, multi: true },
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideAnimations(),
    provideToastr({
      timeOut: 6000,
      positionClass: 'toast-center-screen',
      preventDuplicates: true,
      progressBar: true,
      closeButton: true,
      tapToDismiss: true
    }),
    { provide: LOCALE_ID, useValue: 'pt' },
    importProvidersFrom(
      LucideAngularModule.pick({ Home, User, Calendar, LogIn, UserPlus, Stethoscope, ChevronRight, CalendarCheck,
        MessageSquare, MessageCircle, CircleUser, ChevronFirst, Users, Search, ClipboardList, BanknoteArrowUp,
        Building, ChevronDown, ArrowDownIcon, ArrowUpIcon, ArrowUpDownIcon, Plus, ChevronLeft, CalendarPlus,
        HeartHandshake, Receipt, Mail, Lock, Building2, Microscope, Menu, EllipsisVertical, X, Pencil, Trash,
        BriefcaseMedical, ReceiptText, RefreshCw, Calculator, DollarSign, HandCoins, FileHeart, Check, Printer,
        History, Eye, FileText
       }),
      CalendarModule.forRoot({
          provide: DateAdapter,
          useFactory: momentAdapterFactory
        }
      ),
      NgApexchartsModule
    ),
    provideNgxMask(),
    CalendarUtils
  ]
};
