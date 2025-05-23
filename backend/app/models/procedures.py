from pydantic import BaseModel, Field, ConfigDict
from typing import List
from datetime import datetime


class ProcedureBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    description: str = Field(..., description="Description of the procedure")


class ProcedureCreate(ProcedureBase):
    model_config = ConfigDict(from_attributes=True)
    pass


class Procedure(ProcedureBase):
    model_config = ConfigDict(from_attributes=True)
    
    id: int
    created_at: datetime
    is_deleted: bool = False


class PaginatedProcedures(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    items: List[Procedure]
    total: int
    page: int
    size: int
    pages: int
