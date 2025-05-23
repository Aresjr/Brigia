from fastapi import APIRouter, HTTPException, Depends, status
from typing import Optional
from supabase import create_client, Client
from ..settings import settings
from ..middleware.auth import get_current_user
from ..models.procedure_prices import (
    ProcedurePrice,
    ProcedurePriceCreate,
    PaginatedProcedurePrices
)

router = APIRouter(
    prefix="/procedure-prices",
    tags=["procedure-prices"],
    dependencies=[Depends(get_current_user)]
)

supabase: Client = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)


@router.post("/", response_model=ProcedurePrice, status_code=201)
async def create_procedure_price(price: ProcedurePriceCreate):
    try:
        # First check if both procedure and medical plan exist
        procedure = supabase.table("a_procedures").select("id").eq("id", price.procedure_id).execute()
        if not procedure.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "procedure_not_found",
                    "message": "Procedure not found"
                }
            )

        medical_plan = supabase.table("a_medical_plans").select("id").eq("id", price.medical_plan_id).execute()
        if not medical_plan.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "medical_plan_not_found",
                    "message": "Medical plan not found"
                }
            )

        response = supabase.table("a_procedure_prices").insert(
            price.model_dump(exclude_none=True)
        ).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "create_failed",
                "message": "Failed to create procedure price"
            }
        )
    except HTTPException:
        raise
    except Exception as e:
        error_msg = str(e).lower()
        if "duplicate key" in error_msg and "procedure_prices_procedure_id_medical_plan_id_key" in error_msg:
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail={
                    "code": "already_exists",
                    "message": "A price for this procedure and medical plan already exists"
                }
            )
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "invalid_request",
                "message": str(e)
            }
        )


@router.get("/", response_model=PaginatedProcedurePrices)
async def list_procedure_prices(
    procedure_id: Optional[int] = None,
    medical_plan_id: Optional[int] = None,
    is_deleted: bool = False,
    page: int = 1,
    size: int = 20
):
    try:
        offset = (page - 1) * size
        
        count_query = supabase.table("a_procedure_prices").select("id", count="exact")
        query = supabase.table("a_procedure_prices").select("*")
        
        # Apply filters
        if procedure_id:
            count_query = count_query.eq("procedure_id", procedure_id)
            query = query.eq("procedure_id", procedure_id)
        
        if medical_plan_id:
            count_query = count_query.eq("medical_plan_id", medical_plan_id)
            query = query.eq("medical_plan_id", medical_plan_id)
            
        count_query = count_query.eq("is_deleted", is_deleted)
        query = query.eq("is_deleted", is_deleted)
        
        count_response = count_query.execute()
        total = count_response.count if count_response.count is not None else 0
        
        query = query.order("created_at", desc=True).range(offset, offset + size - 1)
        response = query.execute()
        
        total_pages = (total + size - 1) // size
        
        return PaginatedProcedurePrices(
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


@router.get("/{id}", response_model=ProcedurePrice)
async def get_procedure_price(id: int):
    try:
        response = supabase.table("a_procedure_prices").select("*").eq("id", id).execute()
        
        if not response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Procedure price not found"
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


@router.put("/{id}", response_model=ProcedurePrice)
async def update_procedure_price(id: int, price: ProcedurePriceCreate):
    try:
        # Check if exists
        check_response = supabase.table("a_procedure_prices").select("*").eq("id", id).execute()
        if not check_response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Procedure price not found"
                }
            )

        # Check if procedure exists
        procedure = supabase.table("a_procedures").select("id").eq("id", price.procedure_id).execute()
        if not procedure.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "procedure_not_found",
                    "message": "Procedure not found"
                }
            )

        # Check if medical plan exists
        medical_plan = supabase.table("a_medical_plans").select("id").eq("id", price.medical_plan_id).execute()
        if not medical_plan.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "medical_plan_not_found",
                    "message": "Medical plan not found"
                }
            )

        response = supabase.table("a_procedure_prices").update(
            price.model_dump(exclude_none=True)
        ).eq("id", id).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "update_failed",
                "message": "Failed to update procedure price"
            }
        )
    except HTTPException:
        raise
    except Exception as e:
        error_msg = str(e).lower()
        if "duplicate key" in error_msg and "procedure_prices_procedure_id_medical_plan_id_key" in error_msg:
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail={
                    "code": "already_exists",
                    "message": "A price for this procedure and medical plan already exists"
                }
            )
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "invalid_request",
                "message": str(e)
            }
        )


@router.delete("/{id}", status_code=204)
async def delete_procedure_price(id: int, permanent: bool = False):
    try:
        # Check if exists
        check_response = supabase.table("a_procedure_prices").select("*").eq("id", id).execute()
        if not check_response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Procedure price not found"
                }
            )

        if permanent:
            supabase.table("a_procedure_prices").delete().eq("id", id).execute()
        else:
            supabase.table("a_procedure_prices").update({
                "is_deleted": True
            }).eq("id", id).execute()
        
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
