from pydantic import BaseModel, Field, ConfigDict
from typing import List
from datetime import datetime


class ProfessionalProcedureBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    professional_id: int = Field(..., description="ID of the professional")
    procedure_id: int = Field(..., description="ID of the procedure")


class ProfessionalProcedureCreate(ProfessionalProcedureBase):
    model_config = ConfigDict(from_attributes=True)
    pass


class ProfessionalProcedure(ProfessionalProcedureBase):
    model_config = ConfigDict(from_attributes=True)
    
    id: int
    created_at: datetime


class PaginatedProfessionalProcedures(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    items: List[ProfessionalProcedure]
    total: int
    page: int
    size: int
    pages: int
