from pydantic import BaseModel, Field, ConfigDict
from typing import Optional
from datetime import datetime
from enum import Enum


class AppLanguage(str, Enum):
    EN = "en"
    PT = "pt"


class ProfileBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    name: Optional[str] = None
    avatar_url: Optional[str] = None
    establishment: Optional[str] = None
    role: str = Field(default="user")
    theme: str = Field(default="light")
    language: AppLanguage = Field(default=AppLanguage.EN)


class Profile(ProfileBase):
    model_config = ConfigDict(from_attributes=True)
    
    id: int
    user_id: str
    created_at: datetime
    updated_at: datetime
    is_deleted: bool = False
