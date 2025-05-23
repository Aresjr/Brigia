from pydantic import BaseModel, Field, ConfigDict
from typing import Optional
from datetime import datetime


class MedicalPlanBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    name: str = Field(..., description="Name of the medical plan")
    description: Optional[str] = Field(None, description="Description of the medical plan")
    status: str = Field(default="active", description="Status of the medical plan")


class MedicalPlanCreate(MedicalPlanBase):
    model_config = ConfigDict(from_attributes=True)
    pass


class MedicalPlan(MedicalPlanBase):
    model_config = ConfigDict(from_attributes=True)
    
    id: int
    created_at: datetime
    is_deleted: bool = False
