from fastapi import APIRouter, Cookie, HTTPException, Response, status
from supabase import create_client, Client

from ..models.auth import LoginResponse, LoginCredentials, UserBase
from ..models.profiles import ProfileBase
from ..settings import settings

router = APIRouter(prefix="/auth", tags=["auth"])

supabase: Client = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)


@router.post("/login", response_model=LoginResponse)
async def login(credentials: LoginCredentials, response: Response):
    try:
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
                        "message": "Credenciais inválidas"
                    }
                )
        except HTTPException:
            raise
        except Exception:
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail={
                    "code": "invalid_credentials",
                    "message": "Credenciais inválidas"
                }
            )

        try:
            profile_response = supabase.table("a_profiles").select("*").eq("user_id", auth_response.user.id).execute()
            
            if not profile_response.data:
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

        access_token = auth_response.session.access_token
        refresh_token = auth_response.session.refresh_token

        response.set_cookie("access_token", access_token, httponly=True, secure=True, samesite="strict", max_age=1800)  # 30 min
        response.set_cookie("refresh_token", refresh_token, httponly=True, secure=True, samesite="strict", max_age=604800)  # 7 days

        # Format the response according to LoginResponse model
        return LoginResponse(
            message="Login successful",
            user=UserBase(
                id=auth_response.user.id,
                email=auth_response.user.email
            ),
            profile=ProfileBase(
                name=profile_response.data[0]["name"],
                avatar_url=profile_response.data[0].get("avatar_url"),
                role=profile_response.data[0]["role"],
                theme=profile_response.data[0]["theme"],
                language=profile_response.data[0]["language"],
                establishment=profile_response.data[0].get("establishment")
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

@router.post("/refresh")
async def refresh(response: Response, refresh_token: str = Cookie(None)):
    if not refresh_token:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={
                "code": "missing_token",
                "message": "Missing refresh token"
            }
        )

    try:
        session = supabase.auth.refresh_session(refresh_token)
        new_access = session.session.access_token
        new_refresh = session.session.refresh_token

        response.set_cookie("access_token", new_access, httponly=True, secure=True, samesite="strict", max_age=1800)
        response.set_cookie("refresh_token", new_refresh, httponly=True, secure=True, samesite="strict", max_age=604800)

        return {"message": "Session refreshed"}
    except Exception as e:
        response.delete_cookie("access_token")
        response.delete_cookie("refresh_token")
        
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail={
                "code": "invalid_token",
                "message": "Invalid or expired refresh token"
            }
        )

@router.post("/logout")
async def logout(response: Response):
    response.delete_cookie("access_token")
    response.delete_cookie("refresh_token")

    return {"message": "Logged out"}

