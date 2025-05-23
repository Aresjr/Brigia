from fastapi import APIRouter, HTTPException, Depends, status
from typing import List, Optional
from supabase import create_client, Client, PostgrestAPIError
from ..settings import settings
from ..middleware.auth import get_current_user
from ..models.medical_plans import (
    MedicalPlan,
    MedicalPlanBase,
    MedicalPlanCreate
)

router = APIRouter(
    prefix="/medical-plans",
    tags=["medical-plans"],
    dependencies=[Depends(get_current_user)])

supabase: Client = create_client(
    f"https://{settings.SUPABASE_PROJECT_ID}.supabase.co",
    settings.SUPABASE_JWT_SECRET
)

@router.post("/", response_model=MedicalPlan, status_code=201)
async def create_medical_plan(
    plan: MedicalPlanCreate,
    current_user: dict = Depends(get_current_user)
):
    try:
        response = supabase.table("a_medical_plans").insert({
            "name": plan.name,
            "description": plan.description,
            "status": plan.status
        }).execute()
        
        if response.data and len(response.data) > 0:
            return response.data[0]
        else:
            raise HTTPException(status_code=400, detail="Failed to create medical plan")
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/", response_model=List[MedicalPlan])
async def list_medical_plans(status: Optional[str] = None, is_deleted: bool = False):
    try:
        query = supabase.table("a_medical_plans").select("*")
        
        if status:
            query = query.eq("status", status)
        
        query = query.eq("is_deleted", is_deleted)
        
        response = query.execute()
        
        if response.data:
            return response.data
        return []
    except Exception as e:
        raise HTTPException(status_code=400, detail=str(e))

@router.get("/{plan_id}", response_model=MedicalPlan)
async def get_medical_plan(plan_id: int):
    try:
        response = supabase.table("a_medical_plans").select("*").eq("id", plan_id).execute()
        
        if not response.data:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Medical plan not found")
        return response.data[0]
    except PostgrestAPIError as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(e))
    except Exception as e:
        if "not found" in str(e).lower():
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Medical plan not found")
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(e))

@router.put("/{plan_id}", response_model=MedicalPlan)
async def update_medical_plan(plan_id: int, plan: MedicalPlanBase):
    try:
        check_response = supabase.table("a_medical_plans").select("*").eq("id", plan_id).execute()
        if not check_response.data:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Medical plan not found")

        response = supabase.table("a_medical_plans").update({
            "name": plan.name,
            "description": plan.description,
            "status": plan.status
        }).eq("id", plan_id).execute()
        
        return response.data[0]
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(e))

@router.delete("/{plan_id}", status_code=204)
async def delete_medical_plan(plan_id: int, permanent: bool = False):
    try:
        check_response = supabase.table("a_medical_plans").select("*").eq("id", plan_id).execute()
        if not check_response.data:
            raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Medical plan not found")

        if permanent:
            supabase.table("a_medical_plans").delete().eq("id", plan_id).execute()
        else:
            supabase.table("a_medical_plans").update({
                "is_deleted": True,
                "status": "inactive"
            }).eq("id", plan_id).execute()
        
        return None
    except HTTPException:
        raise
    except Exception as e:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail=str(e))
