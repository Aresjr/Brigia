from unittest.mock import patch, MagicMock
import pytest
from datetime import datetime, timezone
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

# Mock data
MOCK_USER = {
    "id": "test-user-id",
    "email": "test@example.com"
}

MOCK_MEDICAL_PLAN = {
    "id": 1,
    "name": "Premium Plan",
    "description": "Complete coverage medical plan",
    "status": "active",
    "created_at": datetime.now(timezone.utc).isoformat(),
    "is_deleted": False
}

MOCK_TOKEN = "mock-jwt-token"

@pytest.fixture
def mock_auth():
    """Mock authentication for protected routes"""
    with patch('app.middleware.auth.supabase') as mock_supabase:
        # Create a mock user response
        mock_user = MagicMock()
        mock_user.user = MOCK_USER
        
        # Mock the auth methods
        mock_auth = MagicMock()
        mock_auth.get_user.return_value = mock_user
        
        mock_supabase.auth = mock_auth
        yield mock_supabase

@pytest.fixture
def auth_headers():
    """Generate headers with mock JWT token"""
    return {"Authorization": f"Bearer {MOCK_TOKEN}"}

@pytest.fixture
def mock_supabase():
    """Mock Supabase client responses"""
    with patch('app.routes.medical_plans.supabase') as mock:
        mock_response = MagicMock()
        mock_response.data = [MOCK_MEDICAL_PLAN]
        
        # Mock table operations
        mock_table = MagicMock()
        mock_table.insert.return_value.execute.return_value = mock_response
        mock_table.select.return_value.execute.return_value = mock_response
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_response
        mock_table.delete.return_value.eq.return_value.execute.return_value = mock_response
        
        # Set up chaining for filters
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_response
        
        mock.table.return_value = mock_table
        yield mock

def test_create_medical_plan_unauthorized():
    """Test creating medical plan without authentication"""
    response = client.post("/medical-plans/", json={
        "name": "Test Plan",
        "description": "Test Description"
    })
    assert response.status_code == 403
    assert "Not authenticated" in response.json()["detail"]

def test_create_medical_plan(mock_auth, mock_supabase, auth_headers):
    """Test successful medical plan creation"""
    response = client.post(
        "/medical-plans/",
        json={
            "name": "Test Plan",
            "description": "Test Description",
            "status": "active"
        },
        headers=auth_headers
    )
    assert response.status_code == 201
    data = response.json()
    assert data["name"] == MOCK_MEDICAL_PLAN["name"]
    assert data["status"] == "active"
    assert not data["is_deleted"]

def test_list_medical_plans(mock_auth, mock_supabase, auth_headers):
    """Test listing medical plans"""
    response = client.get("/medical-plans/", headers=auth_headers)
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, list)
    assert len(data) > 0
    assert data[0]["id"] == MOCK_MEDICAL_PLAN["id"]

def test_list_medical_plans_with_filters(mock_auth, mock_supabase, auth_headers):
    """Test listing medical plans with status filter"""
    response = client.get(
        "/medical-plans/?status=active&is_deleted=false",
        headers=auth_headers
    )
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data, list)
    assert all(plan["status"] == "active" for plan in data)

def test_get_medical_plan(mock_auth, mock_supabase, auth_headers):
    """Test getting a specific medical plan"""
    response = client.get(f"/medical-plans/{MOCK_MEDICAL_PLAN['id']}", headers=auth_headers)
    assert response.status_code == 200
    data = response.json()
    assert data["id"] == MOCK_MEDICAL_PLAN["id"]
    assert data["name"] == MOCK_MEDICAL_PLAN["name"]

def test_get_nonexistent_medical_plan(mock_auth, mock_supabase, auth_headers):
    """Test getting a medical plan that doesn't exist"""
    # Create a mock response with empty data
    mock_empty_response = MagicMock()
    mock_empty_response.data = []
    
    # Set up the mock chain
    mock_table = MagicMock()
    mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
    mock_supabase.table.return_value = mock_table
    
    response = client.get("/medical-plans/999", headers=auth_headers)
    assert response.status_code == 404
    assert "not found" in response.json()["detail"].lower()

def test_update_medical_plan(mock_auth, mock_supabase, auth_headers):
    """Test updating a medical plan"""
    response = client.put(
        f"/medical-plans/{MOCK_MEDICAL_PLAN['id']}",
        json={
            "name": "Updated Plan",
            "description": "Updated Description",
            "status": "inactive"
        },
        headers=auth_headers
    )
    assert response.status_code == 200
    data = response.json()
    assert data["id"] == MOCK_MEDICAL_PLAN["id"]

def test_update_nonexistent_medical_plan(mock_auth, mock_supabase, auth_headers):
    """Test updating a medical plan that doesn't exist"""
    # Create a mock response with empty data
    mock_empty_response = MagicMock()
    mock_empty_response.data = []
    
    # Set up the mock chain
    mock_table = MagicMock()
    mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
    mock_supabase.table.return_value = mock_table
    
    response = client.put(
        "/medical-plans/999",
        json={
            "name": "Updated Plan",
            "description": "Updated Description",
            "status": "inactive"
        },
        headers=auth_headers
    )
    assert response.status_code == 404
    assert "not found" in response.json()["detail"].lower()

def test_delete_medical_plan(mock_auth, mock_supabase, auth_headers):
    """Test soft deleting a medical plan"""
    response = client.delete(
        f"/medical-plans/{MOCK_MEDICAL_PLAN['id']}",
        headers=auth_headers
    )
    assert response.status_code == 204

def test_permanent_delete_medical_plan(mock_auth, mock_supabase, auth_headers):
    """Test permanently deleting a medical plan"""
    response = client.delete(
        f"/medical-plans/{MOCK_MEDICAL_PLAN['id']}?permanent=true",
        headers=auth_headers
    )
    assert response.status_code == 204

def test_delete_nonexistent_medical_plan(mock_auth, mock_supabase, auth_headers):
    """Test deleting a medical plan that doesn't exist"""
    # Create a mock response with empty data
    mock_empty_response = MagicMock()
    mock_empty_response.data = []
    
    # Set up the mock chain
    mock_table = MagicMock()
    mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
    mock_supabase.table.return_value = mock_table
    
    response = client.delete("/medical-plans/999", headers=auth_headers)
    assert response.status_code == 404
    assert "not found" in response.json()["detail"].lower()

def test_invalid_medical_plan_data(mock_auth, auth_headers):
    """Test creating a medical plan with invalid data"""
    response = client.post(
        "/medical-plans/",
        json={
            "description": "Missing required name field"
        },
        headers=auth_headers
    )
    assert response.status_code == 422
