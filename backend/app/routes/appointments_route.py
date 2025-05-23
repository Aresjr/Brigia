from fastapi import APIRouter, HTTPException, Depends, status, Query
from typing import Optional, List
from datetime import datetime, timezone
from supabase import create_client, Client
from ..settings import settings
from ..middleware.auth import get_current_user
from ..models.appointments import (
    Appointment,
    AppointmentCreate,
    PaginatedAppointments
)

router = APIRouter(
    prefix="/appointments",
    tags=["appointments"],
    dependencies=[Depends(get_current_user)]
)

supabase: Client = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)


@router.post("/", response_model=Appointment, status_code=201)
async def create_appointment(appointment: AppointmentCreate):
    try:
        # First check if patient exists
        patient = supabase.table("a_patients").select("id").eq("id", appointment.patient_id).execute()
        if not patient.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Patient not found"
                }
            )

        # Check if professional exists
        professional = supabase.table("a_professionals").select("id").eq("id", appointment.professional_id).execute()
        if not professional.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Professional not found"
                }
            )

        # Check if medical plan exists if provided
        if appointment.medical_plan_id:
            medical_plan = supabase.table("a_medical_plans").select("id").eq("id", appointment.medical_plan_id).execute()
            if not medical_plan.data:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail={
                        "code": "not_found",
                        "message": "Medical plan not found"
                    }
                )        # Validate dates
        if appointment.end_date <= appointment.start_date:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail={
                    "code": "invalid_dates",
                    "message": "End date must be after start date"
                }
            )

        # Check for overlapping appointments for the professional
        overlap_check = supabase.table("a_appointment") \
            .select("id") \
            .eq("professional_id", appointment.professional_id) \
            .eq("is_deleted", False) \
            .lte("start_date", appointment.start_date) \
            .gte("end_date", appointment.end_date) \
            .execute()
            
        if overlap_check.data:
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail={
                    "code": "appointment_overlap",
                    "message": "The professional has another appointment at this time"
                }
            )

        response = supabase.table("a_appointment").insert(
            appointment.model_dump(exclude_none=True)
        ).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "create_failed",
                "message": "Failed to create appointment"
            }
        )
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


@router.get("/", response_model=PaginatedAppointments)
async def list_appointments(
    patient_id: Optional[int] = None,
    professional_id: Optional[int] = None,
    is_deleted: bool = False,
    is_paid: Optional[bool] = None,
    medical_plan_id: Optional[int] = None,
    start_date: Optional[str] = None,
    end_date: Optional[str] = None,
    page: int = 1,
    size: int = 20
):
    try:
        offset = (page - 1) * size
        
        count_query = supabase.table("a_appointment").select("id", count="exact")
        query = supabase.table("a_appointment").select("*")
        
        # Apply filters
        if patient_id:
            count_query = count_query.eq("patient_id", patient_id)
            query = query.eq("patient_id", patient_id)
        
        if professional_id:
            count_query = count_query.eq("professional_id", professional_id)
            query = query.eq("professional_id", professional_id)
            
        if medical_plan_id:
            count_query = count_query.eq("medical_plan_id", medical_plan_id)
            query = query.eq("medical_plan_id", medical_plan_id)
            
        if is_paid is not None:
            count_query = count_query.eq("is_paid", is_paid)
            query = query.eq("is_paid", is_paid)
            
        if start_date:
            count_query = count_query.gte("start_date", start_date)
            query = query.gte("start_date", start_date)
            
        if end_date:
            count_query = count_query.lte("end_date", end_date)
            query = query.lte("end_date", end_date)
        
        count_query = count_query.eq("is_deleted", is_deleted)
        query = query.eq("is_deleted", is_deleted)
        
        count_response = count_query.execute()
        total = count_response.count if count_response.count is not None else 0
        
        query = query.order("start_date", desc=True).range(offset, offset + size - 1)
        response = query.execute()
        
        total_pages = (total + size - 1) // size
        
        return PaginatedAppointments(
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


@router.get("/{id}", response_model=Appointment)
async def get_appointment(id: int):
    try:
        response = supabase.table("a_appointment").select("*").eq("id", id).execute()
        
        if not response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Appointment not found"
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


@router.put("/{id}", response_model=Appointment)
async def update_appointment(id: int, appointment: AppointmentCreate):
    try:
        # Check if appointment exists
        existing = supabase.table("a_appointment").select("*").eq("id", id).execute()
        if not existing.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Appointment not found"
                }
            )

        # Check if patient exists
        patient = supabase.table("a_patients").select("id").eq("id", appointment.patient_id).execute()
        if not patient.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Patient not found"
                }
            )

        # Check if professional exists
        professional = supabase.table("a_professionals").select("id").eq("id", appointment.professional_id).execute()
        if not professional.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Professional not found"
                }
            )

        # Check if medical plan exists if provided
        if appointment.medical_plan_id:
            medical_plan = supabase.table("a_medical_plans").select("id").eq("id", appointment.medical_plan_id).execute()
            if not medical_plan.data:
                raise HTTPException(
                    status_code=status.HTTP_404_NOT_FOUND,
                    detail={
                        "code": "not_found",
                        "message": "Medical plan not found"
                    }
                )        # Validate dates
        if appointment.end_date <= appointment.start_date:
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail={
                    "code": "invalid_dates",
                    "message": "End date must be after start date"
                }
            )        # Check for overlapping appointments for the professional, excluding this appointment
        overlap_check = supabase.table("a_appointment") \
            .select("id") \
            .eq("professional_id", appointment.professional_id) \
            .eq("is_deleted", False) \
            .neq("id", id) \
            .lte("end_date", appointment.end_date) \
            .gte("start_date", appointment.start_date) \
            .execute()
        
        if overlap_check.data:
            raise HTTPException(
                status_code=status.HTTP_409_CONFLICT,
                detail={
                    "code": "appointment_overlap",
                    "message": "The professional has another appointment at this time"
                }
            )

        response = supabase.table("a_appointment").update(
            appointment.model_dump(exclude_none=True)
        ).eq("id", id).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail={
                "code": "update_failed",
                "message": "Failed to update appointment"
            }
        )
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
async def delete_appointment(id: int, permanent: bool = False):
    try:
        # Check if exists
        check_response = supabase.table("a_appointment").select("*").eq("id", id).execute()
        if not check_response.data:
            raise HTTPException(
                status_code=status.HTTP_404_NOT_FOUND,
                detail={
                    "code": "not_found",
                    "message": "Appointment not found"
                }
            )

        appointment = check_response.data[0]
        current_time = datetime.now(timezone.utc)
        
        # Check if appointment is in the past
        if current_time > datetime.fromisoformat(appointment["start_date"]):
            raise HTTPException(
                status_code=status.HTTP_400_BAD_REQUEST,
                detail={
                    "code": "past_appointment",
                    "message": "Cannot delete appointments that have already started"
                }
            )

        if permanent:
            supabase.table("a_appointment").delete().eq("id", id).execute()
        else:
            supabase.table("a_appointment").update({
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
