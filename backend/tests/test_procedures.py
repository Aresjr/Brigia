from unittest.mock import patch, MagicMock
import pytest
from datetime import datetime, timezone
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

MOCK_USER = {
    "id": "test-user-id",
    "email": "test@example.com"
}

MOCK_PROCEDURE = {
    "id": 1,
    "description": "Test Procedure",
    "created_at": datetime.now(timezone.utc).isoformat(),
    "is_deleted": False
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


def test_create_procedure_unauthorized():
    """Test creating procedure without authentication"""
    response = client.post("/procedures/", json={
        "description": "Test Procedure"
    })
    assert response.status_code == 403
    assert "Not authenticated" in response.json()["detail"]


def test_create_procedure(mock_auth, auth_headers):
    """Test successful procedure creation"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Mock response
        mock_response = create_mock_response([MOCK_PROCEDURE])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.insert.return_value.execute.return_value = mock_response
        mock_supabase.table.return_value = mock_table
        
        response = client.post(
            "/procedures/",
            json={"description": "Test Procedure"},
            headers=auth_headers
        )
        
        assert response.status_code == 201
        data = response.json()
        assert data["description"] == MOCK_PROCEDURE["description"]
        assert not data["is_deleted"]


def test_list_procedures(mock_auth, auth_headers):
    """Test listing procedures with pagination"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        procedure_data = {
            "id": 1,
            "description": "Test Procedure",
            "created_at": datetime.now(timezone.utc).isoformat(),
            "is_deleted": False
        }
        
        # Set up mock responses
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([procedure_data])
        
        # Set up the mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        mock_table.select.return_value.eq.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        mock_table.select.return_value.eq.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        response = client.get("/procedures/", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert "items" in data
        assert len(data["items"]) > 0
        assert data["total"] == 1


def test_get_procedure(mock_auth, auth_headers):
    """Test getting a specific procedure"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Mock response
        mock_response = create_mock_response([MOCK_PROCEDURE])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get(f"/procedures/{MOCK_PROCEDURE['id']}", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == MOCK_PROCEDURE["id"]
        assert data["description"] == MOCK_PROCEDURE["description"]


def test_get_nonexistent_procedure(mock_auth, auth_headers):
    """Test getting a procedure that doesn't exist"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Create a mock response with empty data
        mock_empty_response = create_mock_response([])
        
        # Set up the mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get("/procedures/999", headers=auth_headers)
        assert response.status_code == 404
        error = response.json()["detail"]
        assert error["code"] == "procedure_not_found"


def test_update_procedure(mock_auth, auth_headers):
    """Test updating a procedure"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Mock check response
        mock_check = create_mock_response([MOCK_PROCEDURE])
        # Mock update response
        updated_procedure = {**MOCK_PROCEDURE, "description": "Updated Procedure"}
        mock_update = create_mock_response([updated_procedure])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_update
        mock_supabase.table.return_value = mock_table
        
        response = client.put(
            f"/procedures/{MOCK_PROCEDURE['id']}",
            json={"description": "Updated Procedure"},
            headers=auth_headers
        )
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == MOCK_PROCEDURE["id"]
        assert data["description"] == "Updated Procedure"


def test_update_nonexistent_procedure(mock_auth, auth_headers):
    """Test updating a procedure that doesn't exist"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Create a mock response with empty data
        mock_empty_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.put(
            "/procedures/999",
            json={"description": "Updated Procedure"},
            headers=auth_headers
        )
        assert response.status_code == 404
        error = response.json()["detail"]
        assert error["code"] == "procedure_not_found"


def test_delete_procedure(mock_auth, auth_headers):
    """Test soft deleting a procedure"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Mock data for procedure check
        mock_check_response = create_mock_response([MOCK_PROCEDURE])
        
        # Mock data for delete operation
        mock_delete_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_delete_response
        
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(
            f"/procedures/{MOCK_PROCEDURE['id']}",
            headers=auth_headers
        )
        assert response.status_code == 204


def test_permanent_delete_procedure(mock_auth, auth_headers):
    """Test permanently deleting a procedure"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Mock data for procedure check
        mock_check_response = create_mock_response([MOCK_PROCEDURE])
        
        # Mock data for delete operation
        mock_delete_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.delete.return_value.eq.return_value.execute.return_value = mock_delete_response
        
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(
            f"/procedures/{MOCK_PROCEDURE['id']}?permanent=true",
            headers=auth_headers
        )
        assert response.status_code == 204


def test_delete_nonexistent_procedure(mock_auth, auth_headers):
    """Test deleting a procedure that doesn't exist"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Create a mock response with empty data
        mock_empty_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.delete("/procedures/999", headers=auth_headers)
        assert response.status_code == 404
        error = response.json()["detail"]
        assert error["code"] == "procedure_not_found"


def test_invalid_procedure_data(mock_auth, auth_headers):
    """Test creating a procedure with invalid data"""
    response = client.post(
        "/procedures/",
        json={},  # Missing required description
        headers=auth_headers
    )
    assert response.status_code == 422


def test_list_procedures_pagination(mock_auth, auth_headers):
    """Test paginated list of procedures with various parameters"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        mock_procedures = [
            {**MOCK_PROCEDURE, "id": i, "description": f"Procedure {i}"}
            for i in range(1, 26)  # Create 25 mock procedures
        ]
        
        # Set up mock responses
        mock_count = create_mock_response(None, count=25)
        mock_data = create_mock_response(mock_procedures[:10])
        
        # Set up the mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        mock_table.select.return_value.eq.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        mock_table.select.return_value.eq.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        # Test first page
        response = client.get("/procedures/?page=1&size=10", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert data["total"] == 25
        assert data["page"] == 1
        assert data["size"] == 10
        assert data["pages"] == 3
        assert len(data["items"]) == 10


def test_search_procedures(mock_auth, auth_headers):
    """Test procedure search functionality"""
    with patch('app.routes.procedures_route.supabase') as mock_supabase:
        # Mock search data
        procedure_data = {
            "id": 1,
            "description": "Special Procedure",
            "created_at": datetime.now(timezone.utc).isoformat(),
            "is_deleted": False
        }
        
        # Set up mock responses
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([procedure_data])
        
        # Set up the mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        count_chain.ilike.return_value = count_chain
        mock_table.select.return_value.eq.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        data_chain.ilike.return_value = data_chain
        mock_table.select.return_value.eq.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        # Test search
        response = client.get("/procedures/?search=Special", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert len(data["items"]) == 1
        assert "Special" in data["items"][0]["description"]
