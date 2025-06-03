from pydantic import BaseModel, Field, EmailStr, ConfigDict
from typing import Optional, List
from datetime import datetime, date
from enum import Enum


class PatientAddress(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    cep: Optional[str] = Field(None, max_length=8)
    rua: Optional[str] = Field(None, title="Street name")
    complemento: Optional[str] = Field(None, title="Address complement")
    bairro: Optional[str] = Field(None, title="Neighborhood")
    cidade: Optional[str] = Field(None, title="City")
    uf: Optional[str] = Field(None, max_length=2, title="State")


class PatientBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    name: str = Field(..., min_length=1)
    email: EmailStr
    cpf: Optional[str] = Field(None, max_length=14, min_length=11)
    birth_date: Optional[date] = None
    sex: Optional[str] = Field(None, pattern="^[MF]$")
    cellphone: Optional[str] = None
    image_url: Optional[str] = None
    identification_color: Optional[str] = None
    address_cep: Optional[str] = Field(None, min_length=8, max_length=9)
    address_rua: Optional[str] = None
    address_complemento: Optional[str] = None
    address_bairro: Optional[str] = None
    address_cidade: Optional[str] = None
    address_uf: Optional[str] = Field(None, max_length=2)
    medical_plan_id: Optional[int] = None


class PatientCreate(PatientBase):
    model_config = ConfigDict(from_attributes=True)
    pass


class Patient(PatientBase):
    model_config = ConfigDict(from_attributes=True)
    
    id: int
    created_at: datetime
    last_appointment: Optional[datetime] = None
    next_appointment: Optional[datetime] = None
    is_deleted: bool = False


class OrderBy(str, Enum):
    NAME_ASC = "name"
    NAME_DESC = "-name"
    CREATED_AT_ASC = "created_at"
    CREATED_AT_DESC = "-created_at"
    LAST_APPOINTMENT_ASC = "last_appointment"
    LAST_APPOINTMENT_DESC = "-last_appointment"


class PaginatedPatients(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    items: List[Patient]
    total: int
    page: int
    size: int
    pages: int