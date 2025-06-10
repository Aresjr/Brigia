from pydantic_settings import BaseSettings

class Settings(BaseSettings):
    ENV: str
    FRONTEND_PORT: str
    SUPABASE_PROJECT_ID: str
    SUPABASE_JWT_SECRET: str

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"

settings = Settings()