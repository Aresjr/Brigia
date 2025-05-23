from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    ENV: str
    SUPABASE_PROJECT_ID: str
    SUPABASE_JWT_SECRET: str
    SUPABASE_JWT_ALGO: str = "HS256"

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"

settings = Settings()