from fastapi import APIRouter, HTTPException, Depends, status
from fastapi.responses import Response
from typing import Optional
from supabase import create_client, Client

from ..models.common import CountResponse
from ..settings import settings
from ..middleware.auth import get_current_user
from ..models.patients import (
    Patient,
    PatientBase,
    PatientCreate,
    OrderBy,
    PaginatedPatients, PatientMedicalPlan
)

router = APIRouter(
    prefix="/patients",
    tags=["patients"],
    dependencies=[Depends(get_current_user)]
)

supabase: Client = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)

@router.get("/", response_model=PaginatedPatients)
async def list_patients(
        is_deleted: bool = False,
        medical_plan_id: Optional[int] = None,
        page: int = 1,
        size: int = 20,
        order_by: Optional[OrderBy] = OrderBy.NAME_ASC,
        search: Optional[str] = None
):
    try:
        offset = (page - 1) * size

        count_query = supabase.table("a_patients").select("id", count="exact")
        query = supabase.table("a_patients").select("*")

        if not is_deleted:
            count_query = count_query.eq("is_deleted", False)
            query = query.eq("is_deleted", False)

        if medical_plan_id:
            count_query = count_query.eq("medical_plan_id", medical_plan_id)
            query = query.eq("medical_plan_id", medical_plan_id)

        if search:
            search_term = f"%{search}%"
            count_query = count_query.or_(f"name.ilike.{search_term},email.ilike.{search_term},cpf.ilike.{search_term}")
            query = query.or_(f"name.ilike.{search_term},email.ilike.{search_term},cpf.ilike.{search_term}")

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

        return PaginatedPatients(
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

@router.post("/", response_model=Patient, status_code=201)
async def create_patient(patient: PatientCreate):
    try:
        response = supabase.table("a_patients").insert(patient.model_dump(exclude_none=True)).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        raise HTTPException(status_code=400, detail="Failed to create patient")
    except Exception as e:
        error_msg = str(e).lower()
        if "duplicate key" in error_msg:
            if "email" in error_msg:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail={
                        "code": "email_already_exists",
                        "message": "A patient with this email already exists",
                        "field": "email"
                    }
                )
            elif "cpf" in error_msg:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail={
                        "code": "cpf_already_exists",
                        "message": "A patient with this CPF already exists",
                        "field": "cpf"
                    }
                )
            elif "cellphone" in error_msg:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail={
                        "code": "cellphone_already_exists",
                        "message": "A patient with this cellphone number already exists",
                        "field": "cellphone"
                    }
                )
            else:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail={"code": "unique_violation", "message": "A unique constraint was violated"}
                )
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "invalid_request", "message": str(e)}
        )

@router.get("/count", response_model=CountResponse, status_code=200)
async def count_patients(is_deleted: bool = False):
    try:
        response = supabase.table("a_patients").select("id", count="exact").eq("is_deleted", is_deleted).execute()
        return { "count": int(response.count or 0) }
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "count_failed", "message": str(e)}
        )

@router.get("/{patient_id}", response_model=Patient)
async def get_patient(patient_id: int):
    try:
        response = supabase.table("a_patients").select("*").eq("id", patient_id).execute()
        
        if not response.data:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Patient not found")
        return response.data[0]
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.put("/{patient_id}", response_model=Patient)
async def update_patient(patient_id: int, patient: PatientBase):
    try:
        existing = supabase.table("a_patients").select("*").eq("id", patient_id).execute()
        if not existing.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={"code": "patient_not_found", "message": "Patient not found"}
            )

        response = supabase.table("a_patients").update(
            patient.model_dump(exclude_none=True)
        ).eq("id", patient_id).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "update_failed", "message": "Failed to update patient"}
        )
    except HTTPException:
        raise
    except Exception as e:
        error_msg = str(e).lower()
        if "duplicate key" in error_msg:
            if "email" in error_msg:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail={
                        "code": "email_already_exists",
                        "message": "A patient with this email already exists",
                        "field": "email"
                    }
                )
            elif "cpf" in error_msg:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail={
                        "code": "cpf_already_exists",
                        "message": "A patient with this CPF already exists",
                        "field": "cpf"
                    }
                )
            elif "cellphone" in error_msg:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail={
                        "code": "cellphone_already_exists",
                        "message": "A patient with this cellphone number already exists",
                        "field": "cellphone"
                    }
                )
            else:
                raise HTTPException(
                    status_code=status.HTTP_409_CONFLICT,
                    detail={"code": "unique_violation", "message": "A unique constraint was violated"}
                )
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={"code": "invalid_request", "message": str(e)}
        )

@router.delete("/{patient_id}", status_code=204)
async def delete_patient(patient_id: int, permanent: bool = False):
    try:
        check_response = supabase.table("a_patients").select("*").eq("id", patient_id).execute()
        if not check_response.data:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Patient not found")

        if permanent:
            supabase.table("a_patients").delete().eq("id", patient_id).execute()
        else:
            supabase.table("a_patients").update({
                "is_deleted": True
            }).eq("id", patient_id).execute()
        
        return None
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/{patient_id}/medical-plan", response_model=PatientMedicalPlan)
async def get_patient_medical_plan(patient_id: int):
    try:
        response = supabase.table("a_patient_medical_plans").select("*").eq("patient_id", patient_id).execute()

        if not response.data or len(response.data) == 0:
            return Response(status_code=status.HTTP_204_NO_CONTENT)

        medical_plan = response.data[0]

        print(medical_plan)

        return PatientMedicalPlan(
            id=medical_plan["medical_plan_id"],
            description=medical_plan["description"],
            card_number=medical_plan["card_number"] if "card_number" in medical_plan else None,
            holder_name=medical_plan["holder_name"],
            expiration_date=medical_plan["expiration_date"] if "expiration_date" in medical_plan else None
        )
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))
