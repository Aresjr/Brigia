from fastapi import APIRouter, HTTPException, status
from pydantic import BaseModel, ConfigDict, EmailStr, Field
from supabase import create_client, Client
from ..settings import settings
from ..models.profiles import Profile, ProfileBase

router = APIRouter(prefix="/auth", tags=["auth"])

supabase: Client = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)


class LoginCredentials(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    email: EmailStr = Field(..., min_length=1)
    password: str = Field(..., min_length=1)


class UserResponse(BaseModel):
    model_config = ConfigDict(from_attributes=True)

    id: str
    email: str
    profile: Profile


class LoginResponse(BaseModel):
    model_config = ConfigDict(from_attributes=True)
    
    access_token: str
    token_type: str
    user: UserResponse


@router.post("/login", response_model=LoginResponse)
async def login(credentials: LoginCredentials):
    """
    Login with email and password and return user data with profile
    """
    try:
        # Authenticate user
        try:
            auth_response = supabase.auth.sign_in_with_password({
                "email": credentials.email,
                "password": credentials.password
            })
            
            if not (auth_response.user and auth_response.session):
                raise HTTPException(
                    status_code=status.HTTP_401_UNAUTHORIZED,
                    detail={
                        "code": "invalid_credentials",
                        "message": "Invalid credentials"
                    }
                )
        except HTTPException:
            raise
        except Exception:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail={
                    "code": "invalid_credentials",
                    "message": "Invalid credentials"
                }
            )
        
        # Get user profile
        try:
            profile_response = supabase.table("a_profiles").select("*").eq("user_id", auth_response.user.id).execute()
            
            if not profile_response.data:
                # Create default profile if it doesn't exist
                profile_response = supabase.table("a_profiles").insert({
                    "user_id": auth_response.user.id,
                    "name": auth_response.user.email.split("@")[0],  # Use email username as default name
                    "role": "user",
                    "theme": "light",
                    "language": "en"
                }).execute()
            
            if not profile_response.data:
                raise HTTPException(
                    status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                    detail={
                        "code": "profile_error",
                        "message": "Failed to retrieve user profile"
                    }
                )
        except HTTPException:
            raise
        except Exception as e:
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail={
                    "code": "profile_error",
                    "message": f"Failed to retrieve user profile: {str(e)}"
                }
            )
        
        return LoginResponse(
            access_token=auth_response.session.access_token,
            token_type="bearer",
            user=UserResponse(
                id=auth_response.user.id,
                email=auth_response.user.email,
                profile=profile_response.data[0]
            )
        )
            
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail={
                "code": "server_error",
                "message": str(e)
            }
        )