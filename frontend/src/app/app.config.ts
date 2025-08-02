import { ApplicationConfig, provideZoneChangeDetection, importProvidersFrom } from '@angular/core';
import { provideRouter } from '@angular/router';
import { routes } from './app.routes';
import { provideHttpClient } from '@angular/common/http';
import { provideAnimations } from '@angular/platform-browser/animations';
import { provideToastr } from 'ngx-toastr';
import { LucideAngularModule } from 'lucide-angular';
import { Home, User, Calendar, LogIn, UserPlus, Stethoscope, ChevronRight, MessageSquare,
  MessageCircle, CircleUser, ChevronFirst, Users, Search, ClipboardList, Building, ChevronDown,
  ArrowDownIcon, ArrowUpIcon, ArrowUpDownIcon, Plus, ChevronLeft, HeartHandshake
 } from 'lucide-angular/src/icons';
import { provideNgxMask } from 'ngx-mask';

export const appConfig: ApplicationConfig = {
  providers: [
    provideHttpClient(),
    provideZoneChangeDetection({ eventCoalescing: true }),
    provideRouter(routes),
    provideAnimations(),
    provideToastr({
      timeOut: 5000,
      positionClass: 'toast-bottom-right',
      preventDuplicates: true,
      progressBar: true,
      closeButton: true,
      tapToDismiss: true
    }),
    importProvidersFrom(
      LucideAngularModule.pick({ Home, User, Calendar, LogIn, UserPlus, Stethoscope, ChevronRight,
        MessageSquare, MessageCircle, CircleUser, ChevronFirst, Users, Search, ClipboardList,
        Building, ChevronDown, ArrowDownIcon, ArrowUpIcon, ArrowUpDownIcon, Plus, ChevronLeft,
        HeartHandshake
       })
    ),
    provideNgxMask()
  ]
};
