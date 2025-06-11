from fastapi import Cookie, HTTPException
from fastapi.security import HTTPBearer
from supabase import create_client
import jwt

from ..settings import settings

security = HTTPBearer()
supabase = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)

def get_current_user(access_token: str = Cookie(None)):
    if not access_token:
        raise HTTPException(status_code=401, detail="Not authenticated")
    try:
        payload = jwt.decode(access_token, options={"verify_signature": False})  # or use Supabase's JWT key
        return payload
    except Exception:
        raise HTTPException(status_code=401, detail="Invalid token")
