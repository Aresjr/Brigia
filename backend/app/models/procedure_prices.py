from pydantic import BaseModel, Field, ConfigDict
from typing import List
from datetime import datetime


class ProcedurePriceBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    procedure_id: int = Field(..., description="ID of the procedure")
    medical_plan_id: int = Field(..., description="ID of the medical plan")
    price: float = Field(..., ge=0, description="Price of the procedure for this medical plan")


class ProcedurePriceCreate(ProcedurePriceBase):
    model_config = ConfigDict(from_attributes=True)
    pass


class ProcedurePrice(ProcedurePriceBase):
    model_config = ConfigDict(from_attributes=True)
    
    id: int
    created_at: datetime
    is_deleted: bool = False


class PaginatedProcedurePrices(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    items: List[ProcedurePrice]
    total: int
    page: int
    size: int
    pages: int
