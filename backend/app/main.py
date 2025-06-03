from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from .settings import settings
from .routes import (
    auth_route as auth,
    medical_plans_route as medical_plans,
    patients_route as patients,
    procedures_route as procedures,
    professional_procedures_route as professional_procedures,
    procedure_prices_route as procedure_prices,
    appointments_route as appointments
)

if settings.ENV == "prod":
    app = FastAPI(
        docs_url=None,
        redoc_url=None,
        openapi_url=None
    )
else:
    app = FastAPI()

origins = [
    "http://localhost:" + str(settings.FRONTEND_PORT),
    "http://*.nemeia.com.br:" + str(settings.FRONTEND_PORT)
]

app.add_middleware(
    CORSMiddleware,  # type: ignore
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(auth.router)
app.include_router(medical_plans.router)
app.include_router(patients.router)
app.include_router(procedures.router)
app.include_router(professional_procedures.router)
app.include_router(procedure_prices.router)
app.include_router(appointments.router)
