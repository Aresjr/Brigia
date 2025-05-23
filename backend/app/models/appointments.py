from pydantic import BaseModel, Field, ConfigDict
from typing import List, Optional
from datetime import datetime


class AppointmentBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    patient_id: int = Field(..., description="ID of the patient")
    professional_id: int = Field(..., description="ID of the professional")
    start_date: datetime = Field(..., description="Start date and time of the appointment")
    end_date: datetime = Field(..., description="End date and time of the appointment")
    description: Optional[str] = Field(None, description="Description of the appointment")
    medical_plan_id: Optional[int] = Field(None, description="ID of the medical plan used")
    procedure_id: Optional[int] = Field(None, description="ID of the procedure performed in this appointment")
    is_paid: bool = Field(default=False, description="Whether the appointment has been paid")
    cost: Optional[float] = Field(None, ge=0, description="Cost of the appointment")


class AppointmentCreate(AppointmentBase):
    model_config = ConfigDict(from_attributes=True)
    pass


class Appointment(AppointmentBase):
    model_config = ConfigDict(from_attributes=True)
    
    id: int
    created_at: datetime
    is_deleted: bool = False


class PaginatedAppointments(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    items: List[Appointment]
    total: int
    page: int
    size: int
    pages: int
