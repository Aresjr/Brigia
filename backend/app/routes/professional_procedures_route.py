from fastapi import APIRouter, HTTPException, Depends, status
from typing import Optional
from supabase import create_client, Client
from ..settings import settings
from ..middleware.auth import get_current_user
from ..models.professional_procedures import (
    ProfessionalProcedure,
    ProfessionalProcedureCreate,
    PaginatedProfessionalProcedures
)

router = APIRouter(
    prefix="/professional-procedures",
    tags=["professional-procedures"],
    dependencies=[Depends(get_current_user)]
)

supabase: Client = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)


@router.post("/", response_model=ProfessionalProcedure, status_code=201)
async def create_professional_procedure(procedure: ProfessionalProcedureCreate):
    try:
        # First check if both professional and procedure exist
        professional = supabase.table("a_professionals").select("id").eq("id", procedure.professional_id).execute()
        if not professional.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "professional_not_found",
                    "message": "Professional not found"
                }
            )

        proc = supabase.table("a_procedures").select("id").eq("id", procedure.procedure_id).execute()
        if not proc.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "procedure_not_found",
                    "message": "Procedure not found"
                }
            )

        response = supabase.table("a_professional_procedures").insert(
            procedure.model_dump(exclude_none=True)
        ).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "create_failed",
                "message": "Failed to create professional procedure"
            }
        )
    except HTTPException:
        raise
    except Exception as e:
        error_msg = str(e).lower()
        if "duplicate key" in error_msg and "professional_procedures_professional_id_procedure_id_key" in error_msg:
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail={
                    "code": "already_exists",
                    "message": "This procedure is already assigned to this professional"
                }
            )
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "invalid_request",
                "message": str(e)
            }
        )


@router.get("/", response_model=PaginatedProfessionalProcedures)
async def list_professional_procedures(
    professional_id: Optional[int] = None,
    page: int = 1,
    size: int = 20
):
    try:
        offset = (page - 1) * size
        
        count_query = supabase.table("a_professional_procedures").select("id", count="exact")
        query = supabase.table("a_professional_procedures").select("*")
        
        if professional_id:
            count_query = count_query.eq("professional_id", professional_id)
            query = query.eq("professional_id", professional_id)
        
        count_response = count_query.execute()
        total = count_response.count if count_response.count is not None else 0
        
        query = query.order("created_at", desc=True).range(offset, offset + size - 1)
        response = query.execute()
        
        total_pages = (total + size - 1) // size
        
        return PaginatedProfessionalProcedures(
            items=response.data or [],
            total=total,
            page=page,
            size=size,
            pages=total_pages
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "list_failed",
                "message": str(e)
            }
        )


@router.get("/{id}", response_model=ProfessionalProcedure)
async def get_professional_procedure(id: int):
    try:
        response = supabase.table("a_professional_procedures").select("*").eq("id", id).execute()
        
        if not response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Professional procedure not found"
                }
            )
        return response.data[0]
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "invalid_request",
                "message": str(e)
            }
        )


@router.delete("/{id}", status_code=204)
async def delete_professional_procedure(id: int):
    try:
        # Check if exists
        check_response = supabase.table("a_professional_procedures").select("*").eq("id", id).execute()
        if not check_response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Professional procedure not found"
                }
            )

        supabase.table("a_professional_procedures").delete().eq("id", id).execute()
        return None
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "delete_failed",
                "message": str(e)
            }
        )
