from pydantic import BaseModel, ConfigDict, EmailStr, Field
from ..models.profiles import ProfileBase


class LoginCredentials(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    email: EmailStr = Field(..., min_length=1)
    password: str = Field(..., min_length=1)


class UserBase(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    id: str
    email: str


class LoginResponse(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    message: str
    user: UserBase
    profile: ProfileBase
