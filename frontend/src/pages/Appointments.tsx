import { useState, useEffect } from "react";
import { Calendar } from "@/components/ui/calendar";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Card, CardContent } from "@/components/ui/card";
import { format, startOfWeek, endOfWeek, eachDayOfInterval, isWithinInterval, isToday, isSameDay, isValid } from "date-fns";
import { pt } from "date-fns/locale";
import { useQuery } from "@tanstack/react-query";
import { Appointment } from "@/models/models";
import { Badge } from "@/components/ui/badge";
import { Skeleton } from "@/components/ui/skeleton";
import { CalendarClock, CalendarDays, Calendar as CalendarIcon } from "lucide-react";
import { Popover, PopoverContent, PopoverTrigger } from "@/components/ui/popover";
import { Button } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import {getAppointments} from "@/api/appointmentsApi.ts";

const Appointments = () => {
  const [view, setView] = useState<"daily" | "weekly" | "monthly">("daily");
  const [selectedDate, setSelectedDate] = useState<Date>(new Date());
  const [weekDays, setWeekDays] = useState<Date[]>([]);

  const { data: appointments = [], isLoading } = useQuery({
    queryKey: ['appointments'],
    queryFn: () => getAppointments(),
  });

  useEffect(() => {
    if (view === "weekly") {
      const start = startOfWeek(selectedDate, { weekStartsOn: 0 });
      const end = endOfWeek(selectedDate, { weekStartsOn: 0 });
      setWeekDays(eachDayOfInterval({ start, end }));
    }
  }, [selectedDate, view]);

  const filteredAppointments = appointments.filter((appointment) => {
    if (!appointment.start_date) return false;
    
    const appointmentDate = new Date(appointment.start_date);
    if (!isValid(appointmentDate)) return false;
    
    if (view === "daily") {
      return isSameDay(appointmentDate, selectedDate);
    } else if (view === "weekly") {
      const start = startOfWeek(selectedDate, { weekStartsOn: 0 });
      const end = endOfWeek(selectedDate, { weekStartsOn: 0 });
      return isWithinInterval(appointmentDate, { start, end });
    } else {
      return true;
    }
  });

  const getDayAppointments = (day: Date) => {
    if (!day || !isValid(day)) return [];
    
    return appointments.filter(appointment => {
      if (!appointment.start_date) return false;
      const appointmentDate = new Date(appointment.start_date);
      return isValid(appointmentDate) && isSameDay(appointmentDate, day);
    });
  };

  const formatAppointmentDate = (dateString: string | undefined) => {
    if (!dateString) return '';
    
    try {
      const date = new Date(dateString);
      if (!isValid(date)) return '';
      return format(date, "HH:mm");
    } catch (error) {
      console.error("Error formatting appointment date:", error, dateString);
      return '';
    }
  };

  const renderDailyView = () => {
    const dayAppointments = getDayAppointments(selectedDate);
    
    return (
      <div className="space-y-4">
        <div className="flex justify-between items-center mb-4">
          <h2 className="text-xl font-bold">
            {format(selectedDate, "EEEE, d 'de' MMMM 'de' yyyy", { locale: pt })}
            {isToday(selectedDate) && <Badge className="ml-2 bg-blue-500">Hoje</Badge>}
          </h2>
          <Popover>
            <PopoverTrigger asChild>
              <Button variant="outline" className="gap-2">
                <CalendarIcon className="h-4 w-4" />
                Selecionar data
              </Button>
            </PopoverTrigger>
            <PopoverContent className="w-auto p-0" align="end">
              <Calendar
                mode="single"
                selected={selectedDate}
                onSelect={(date) => date && setSelectedDate(date)}
                initialFocus
                className="pointer-events-auto"
              />
            </PopoverContent>
          </Popover>
        </div>
        
        {isLoading ? (
          Array.from({ length: 3 }).map((_, i) => (
            <Card key={i} className="mb-2">
              <CardContent className="p-4">
                <div className="flex justify-between">
                  <Skeleton className="h-6 w-1/3" />
                  <Skeleton className="h-6 w-1/4" />
                </div>
                <Skeleton className="h-4 w-1/2 mt-2" />
              </CardContent>
            </Card>
          ))
        ) : dayAppointments.length > 0 ? (
          dayAppointments.map((appointment) => (
            <AppointmentCard key={appointment.id} appointment={appointment} />
          ))
        ) : (
          <div className="text-center py-8 text-muted-foreground">
            Não há consultas agendadas para esta data.
          </div>
        )}
      </div>
    );
  };

  const renderWeeklyView = () => {
    if (!weekDays.length) return <div>Carregando...</div>;
    
    return (
      <div className="space-y-4">
        <div className="flex justify-between items-center mb-4">
          <h2 className="text-xl font-bold">
            {weekDays[0] && isValid(weekDays[0]) 
              ? `${format(weekDays[0], "d 'de' MMMM", { locale: pt })} - ${
                  weekDays[6] && isValid(weekDays[6]) 
                    ? format(weekDays[6], "d 'de' MMMM 'de' yyyy", { locale: pt })
                    : ''
                }`
              : 'Semana atual'}
          </h2>
          <Popover>
            <PopoverTrigger asChild>
              <Button variant="outline" className="gap-2">
                <CalendarIcon className="h-4 w-4" />
                Selecionar semana
              </Button>
            </PopoverTrigger>
            <PopoverContent className="w-auto p-0" align="end">
              <Calendar
                mode="single"
                selected={selectedDate}
                onSelect={(date) => date && setSelectedDate(date)}
                initialFocus
                className="pointer-events-auto"
              />
            </PopoverContent>
          </Popover>
        </div>
        
        <div className="grid grid-cols-7 gap-2">
          {weekDays.map((day, i) => (
            <div key={i} className="text-center">
              <div className={cn(
                "p-2 rounded-md font-medium",
                isValid(day) && isToday(day) ? "bg-blue-500 text-white" : ""
              )}>
                {isValid(day) ? format(day, "EEE", { locale: pt }) : ''}
                <div>{isValid(day) ? format(day, "d") : ''}</div>
              </div>
            </div>
          ))}
        </div>
        
        <div className="grid grid-cols-7 gap-2 mt-2">
          {weekDays.map((day, i) => {
            const dayAppointments = isValid(day) ? getDayAppointments(day) : [];
            return (
              <div key={i} className="h-[300px] overflow-auto border rounded-md p-2">
                {isLoading ? (
                  <Skeleton className="h-full w-full" />
                ) : dayAppointments.length > 0 ? (
                  dayAppointments.map((appointment) => (
                    <div 
                      key={appointment.id} 
                      className="p-2 mb-2 rounded-md text-xs bg-blue-50 border border-blue-200"
                    >
                      <div className="font-medium truncate">
                        {formatAppointmentDate(appointment.start_date)}
                      </div>
                      <div className="truncate">
                        {appointment.description || "Consulta"}
                      </div>
                    </div>
                  ))
                ) : (
                  <div className="text-center text-xs text-muted-foreground h-full flex items-center justify-center">
                    Nenhuma consulta
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>
    );
  };

  const renderMonthlyView = () => {
    return (
      <div className="space-y-4">
        <div className="flex justify-between items-center mb-4">
          <h2 className="text-xl font-bold">
            {format(selectedDate, "MMMM 'de' yyyy", { locale: pt })}
          </h2>
        </div>
        
        <Calendar
          mode="single"
          selected={selectedDate}
          onSelect={(date) => date && setSelectedDate(date)}
          className="rounded-md border pointer-events-auto"
          modifiers={{
            hasAppointment: appointments
              .filter(a => a.start_date)
              .map(a => {
                try {
                  const date = new Date(a.start_date);
                  return isValid(date) ? date : null;
                } catch (e) {
                  return null;
                }
              })
              .filter(Boolean) as Date[]
          }}
          modifiersStyles={{
            hasAppointment: { 
              fontWeight: 'bold', 
              backgroundColor: 'rgba(59, 130, 246, 0.1)',
              borderBottom: '2px solid rgb(59, 130, 246)'
            }
          }}
          footer={(
            <div className="mt-4 text-xs text-muted-foreground">
              {getDayAppointments(selectedDate).length} consultas em {format(selectedDate, "d 'de' MMMM", { locale: pt })}
            </div>
          )}
        />
        
        {getDayAppointments(selectedDate).length > 0 && (
          <div className="mt-4">
            <h3 className="font-medium mb-2">Consultas em {format(selectedDate, "d 'de' MMMM", { locale: pt })}</h3>
            <div className="space-y-2">
              {getDayAppointments(selectedDate).map(appointment => (
                <AppointmentCard key={appointment.id} appointment={appointment} />
              ))}
            </div>
          </div>
        )}
      </div>
    );
  };

  return (
    <div className="p-6 bg-white min-h-screen">
      <div className="mb-6">
        <h1 className="text-2xl font-bold">Agendamentos</h1>
      </div>
      
      <Tabs defaultValue="daily" value={view} onValueChange={(v) => setView(v as any)}>
        <TabsList className="mb-4">
          <TabsTrigger value="daily" className="flex items-center gap-2">
            <CalendarClock className="h-4 w-4" />
            Diária
          </TabsTrigger>
          <TabsTrigger value="weekly" className="flex items-center gap-2">
            <CalendarDays className="h-4 w-4" />
            Semanal
          </TabsTrigger>
          <TabsTrigger value="monthly" className="flex items-center gap-2">
            <CalendarIcon className="h-4 w-4" />
            Mensal
          </TabsTrigger>
        </TabsList>
        
        <TabsContent value="daily" className="mt-0">
          {renderDailyView()}
        </TabsContent>
        
        <TabsContent value="weekly" className="mt-0">
          {renderWeeklyView()}
        </TabsContent>
        
        <TabsContent value="monthly" className="mt-0">
          {renderMonthlyView()}
        </TabsContent>
      </Tabs>
    </div>
  );
};

const AppointmentCard = ({ appointment }: { appointment: Appointment }) => {
  const formatAppointmentTime = (dateString: string | undefined) => {
    if (!dateString) return '';
    
    try {
      const date = new Date(dateString);
      if (!isValid(date)) return '';
      return format(date, "HH:mm");
    } catch (error) {
      console.error("Error formatting appointment time:", error, dateString);
      return '';
    }
  };

  return (
    <Card className="mb-2 hover:shadow-md transition-shadow">
      <CardContent className="p-4">
        <div className="flex justify-between">
          <div className="font-medium">
            {formatAppointmentTime(appointment.start_date)} - {formatAppointmentTime(appointment.end_date)}
          </div>
          <div>
            {appointment.is_paid ? (
              <Badge variant="outline" className="bg-green-50 text-green-700 border-green-200">Pago</Badge>
            ) : (
              <Badge variant="outline" className="bg-yellow-50 text-yellow-700 border-yellow-200">Pendente</Badge>
            )}
          </div>
        </div>
        <div className="text-sm text-muted-foreground mt-1">
          {appointment.description || "Consulta"}
        </div>
        {appointment.cost && (
          <div className="text-sm font-medium mt-1">
            Valor: R$ {Number(appointment.cost).toFixed(2).replace('.', ',')}
          </div>
        )}
      </CardContent>
    </Card>
  );
};

export default Appointments;
