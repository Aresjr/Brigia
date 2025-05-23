from fastapi import APIRouter, HTTPException, Depends, status
from typing import Optional
from supabase import create_client, Client
from ..settings import settings
from ..middleware.auth import get_current_user
from ..models.procedures import (
    ProcedureCreate,
    Procedure,
    PaginatedProcedures,
)
from enum import Enum

router = APIRouter(
    prefix="/procedures",
    tags=["procedures"],
    dependencies=[Depends(get_current_user)]
)

supabase: Client = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)


class OrderBy(str, Enum):
    DESCRIPTION_ASC = "description"
    DESCRIPTION_DESC = "-description"
    CREATED_AT_ASC = "created_at"
    CREATED_AT_DESC = "-created_at"


@router.post("/", response_model=Procedure, status_code=201)
async def create_procedure(procedure: ProcedureCreate):
    try:
        response = supabase.table("a_procedures").insert(
            procedure.model_dump(exclude_none=True)
        ).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "create_failed", "message": "Failed to create procedure"}
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "invalid_request", "message": str(e)}
        )


@router.get("/", response_model=PaginatedProcedures)
async def list_procedures(
    is_deleted: bool = False,
    page: int = 1,
    size: int = 20,
    order_by: Optional[OrderBy] = OrderBy.DESCRIPTION_ASC,
    search: Optional[str] = None
):
    try:
        offset = (page - 1) * size
        
        count_query = supabase.table("a_procedures").select("id", count="exact")
        query = supabase.table("a_procedures").select("*")
        
        if not is_deleted:
            count_query = count_query.eq("is_deleted", False)
            query = query.eq("is_deleted", False)
        
        if search:
            search_term = f"%{search}%"
            count_query = count_query.ilike("description", search_term)
            query = query.ilike("description", search_term)
        
        count_response = count_query.execute()
        total = count_response.count if count_response.count is not None else 0
        
        if order_by:
            order_field = order_by.value
            if order_field.startswith("-"):
                query = query.order(order_field[1:], desc=True)
            else:
                query = query.order(order_field)
        
        query = query.range(offset, offset + size - 1)
        
        response = query.execute()
        
        total_pages = (total + size - 1) // size
        
        return PaginatedProcedures(
            items=response.data or [],
            total=total,
            page=page,
            size=size,
            pages=total_pages
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "list_failed", "message": str(e)}
        )


@router.get("/{procedure_id}", response_model=Procedure)
async def get_procedure(procedure_id: int):
    try:
        response = supabase.table("a_procedures").select("*").eq("id", procedure_id).execute()
        
        if not response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={"code": "procedure_not_found", "message": "Procedure not found"}
            )
        return response.data[0]
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "invalid_request", "message": str(e)}
        )


@router.put("/{procedure_id}", response_model=Procedure)
async def update_procedure(procedure_id: int, procedure: ProcedureCreate):
    try:
        existing = supabase.table("a_procedures").select("*").eq("id", procedure_id).execute()
        if not existing.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={"code": "procedure_not_found", "message": "Procedure not found"}
            )

        response = supabase.table("a_procedures").update(
            procedure.model_dump(exclude_none=True)
        ).eq("id", procedure_id).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "update_failed", "message": "Failed to update procedure"}
        )
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "invalid_request", "message": str(e)}
        )


@router.delete("/{procedure_id}", status_code=204)
async def delete_procedure(procedure_id: int, permanent: bool = False):
    try:
        check_response = supabase.table("a_procedures").select("*").eq("id", procedure_id).execute()
        if not check_response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={"code": "procedure_not_found", "message": "Procedure not found"}
            )

        if permanent:
            supabase.table("a_procedures").delete().eq("id", procedure_id).execute()
        else:
            supabase.table("a_procedures").update({
                "is_deleted": True
            }).eq("id", procedure_id).execute()
        
        return None
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "invalid_request", "message": str(e)}
        )
