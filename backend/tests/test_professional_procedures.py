import pytest
from unittest.mock import patch, MagicMock
from datetime import datetime, timezone
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

# Mock data
MOCK_USER = {
    "id": "test-user-id",
    "email": "test@example.com"
}

MOCK_PROFESSIONAL_PROCEDURE = {
    "id": 1,
    "professional_id": 1,
    "procedure_id": 1,
    "created_at": datetime.now(timezone.utc).isoformat()
}

MOCK_TOKEN = "mock-jwt-token"


def create_mock_response(data, count=None):
    """Create a mock response object"""
    mock_response = MagicMock()
    mock_response.data = data
    mock_response.count = count
    return mock_response


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


def test_create_professional_procedure_unauthorized():
    """Test creating professional procedure without authentication"""
    response = client.post("/professional-procedures/", json={
        "professional_id": 1,
        "procedure_id": 1
    })
    assert response.status_code == 403
    assert "Not authenticated" in response.json()["detail"]


def test_create_professional_procedure(mock_auth, auth_headers):
    """Test successful professional procedure creation"""
    with patch('app.routes.professional_procedures_route.supabase') as mock_supabase:
        # Mock professional check
        mock_prof_response = create_mock_response([{"id": 1}])
        # Mock procedure check
        mock_proc_response = create_mock_response([{"id": 1}])
        # Mock creation response
        mock_create_response = create_mock_response([MOCK_PROFESSIONAL_PROCEDURE])
        
        # Set up mock table responses
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.side_effect = [
            mock_prof_response,  # For professional check
            mock_proc_response,  # For procedure check
        ]
        mock_table.insert.return_value.execute.return_value = mock_create_response
        
        mock_supabase.table.return_value = mock_table
        
        response = client.post(
            "/professional-procedures/",
            json={
                "professional_id": 1,
                "procedure_id": 1
            },
            headers=auth_headers
        )
        
        assert response.status_code == 201
        data = response.json()
        assert data["professional_id"] == MOCK_PROFESSIONAL_PROCEDURE["professional_id"]
        assert data["procedure_id"] == MOCK_PROFESSIONAL_PROCEDURE["procedure_id"]


def test_create_professional_procedure_duplicate(mock_auth, auth_headers):
    """Test creating duplicate professional procedure"""
    with patch('app.routes.professional_procedures_route.supabase') as mock_supabase:
        # Mock professional and procedure existence checks
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = create_mock_response([{"id": 1}])
        
        # Mock duplicate error
        mock_table.insert.return_value.execute.side_effect = Exception(
            'duplicate key value violates unique constraint "professional_procedures_professional_id_procedure_id_key"'
        )
        
        mock_supabase.table.return_value = mock_table
        
        response = client.post(
            "/professional-procedures/",
            json={
                "professional_id": 1,
                "procedure_id": 1
            },
            headers=auth_headers
        )
        
        assert response.status_code == 409
        error = response.json()["detail"]
        assert error["code"] == "already_exists"


def test_list_professional_procedures(mock_auth, auth_headers):
    """Test listing professional procedures"""
    with patch('app.routes.professional_procedures_route.supabase') as mock_supabase:
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([MOCK_PROFESSIONAL_PROCEDURE])
          # Set up mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        mock_table.select.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        data_chain.order.return_value = data_chain
        mock_table.select.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        response = client.get("/professional-procedures/", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert "items" in data
        assert len(data["items"]) > 0
        assert data["total"] == 1


def test_get_professional_procedure(mock_auth, auth_headers):
    """Test getting a specific professional procedure"""
    with patch('app.routes.professional_procedures_route.supabase') as mock_supabase:
        # Mock response
        mock_response = create_mock_response([MOCK_PROFESSIONAL_PROCEDURE])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get(f"/professional-procedures/{MOCK_PROFESSIONAL_PROCEDURE['id']}", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == MOCK_PROFESSIONAL_PROCEDURE["id"]
        assert data["professional_id"] == MOCK_PROFESSIONAL_PROCEDURE["professional_id"]
        assert data["procedure_id"] == MOCK_PROFESSIONAL_PROCEDURE["procedure_id"]


def test_get_nonexistent_professional_procedure(mock_auth, auth_headers):
    """Test getting a professional procedure that doesn't exist"""
    with patch('app.routes.professional_procedures_route.supabase') as mock_supabase:
        # Create a mock response with empty data
        mock_empty_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get("/professional-procedures/999", headers=auth_headers)
        assert response.status_code == 404
        error = response.json()["detail"]
        assert error["code"] == "not_found"


def test_delete_professional_procedure(mock_auth, auth_headers):
    """Test deleting a professional procedure"""
    with patch('app.routes.professional_procedures_route.supabase') as mock_supabase:
        # Mock check response
        mock_check_response = create_mock_response([MOCK_PROFESSIONAL_PROCEDURE])
        # Mock delete response
        mock_delete_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.delete.return_value.eq.return_value.execute.return_value = mock_delete_response
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(f"/professional-procedures/{MOCK_PROFESSIONAL_PROCEDURE['id']}", headers=auth_headers)
        assert response.status_code == 204


def test_delete_nonexistent_professional_procedure(mock_auth, auth_headers):
    """Test deleting a professional procedure that doesn't exist"""
    with patch('app.routes.professional_procedures_route.supabase') as mock_supabase:
        # Create a mock response with empty data
        mock_empty_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.delete("/professional-procedures/999", headers=auth_headers)
        assert response.status_code == 404
        error = response.json()["detail"]
        assert error["code"] == "not_found"
