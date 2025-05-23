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

MOCK_PROCEDURE_PRICE = {
    "id": 1,
    "procedure_id": 1,
    "medical_plan_id": 1,
    "price": 100.00,
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


def test_create_procedure_price_unauthorized():
    """Test creating procedure price without authentication"""
    response = client.post("/procedure-prices/", json={
        "procedure_id": 1,
        "medical_plan_id": 1,
        "price": 100.00
    })
    assert response.status_code == 403
    assert "Not authenticated" in response.json()["detail"]


def test_create_procedure_price(mock_auth, auth_headers):
    """Test successful procedure price creation"""
    with patch('app.routes.procedure_prices_route.supabase') as mock_supabase:
        # Mock procedure and medical plan checks
        mock_check_response = create_mock_response([{"id": 1}])
        
        # Mock creation response
        mock_create_response = create_mock_response([MOCK_PROCEDURE_PRICE])
        
        # Set up mock table with chain
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.insert.return_value.execute.return_value = mock_create_response
        
        mock_supabase.table.return_value = mock_table
        
        response = client.post(
            "/procedure-prices/",
            json={
                "procedure_id": 1,
                "medical_plan_id": 1,
                "price": 100.00
            },
            headers=auth_headers
        )
        
        assert response.status_code == 201
        data = response.json()
        assert data["procedure_id"] == MOCK_PROCEDURE_PRICE["procedure_id"]
        assert data["medical_plan_id"] == MOCK_PROCEDURE_PRICE["medical_plan_id"]
        assert data["price"] == MOCK_PROCEDURE_PRICE["price"]
        assert not data["is_deleted"]


def test_create_procedure_price_duplicate(mock_auth, auth_headers):
    """Test creating duplicate procedure price"""
    with patch('app.routes.procedure_prices_route.supabase') as mock_supabase:
        # Mock procedure and medical plan checks
        mock_check_response = create_mock_response([{"id": 1}])
        
        # Mock duplicate error
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.insert.return_value.execute.side_effect = Exception(
            'duplicate key value violates unique constraint "procedure_prices_procedure_id_medical_plan_id_key"'
        )
        
        mock_supabase.table.return_value = mock_table
        
        response = client.post(
            "/procedure-prices/",
            json={
                "procedure_id": 1,
                "medical_plan_id": 1,
                "price": 100.00
            },
            headers=auth_headers
        )
        
        assert response.status_code == 409
        data = response.json()
        assert data["detail"]["code"] == "already_exists"


def test_list_procedure_prices(mock_auth, auth_headers):
    """Test listing procedure prices"""
    with patch('app.routes.procedure_prices_route.supabase') as mock_supabase:
        # Set up mock responses
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([MOCK_PROCEDURE_PRICE])
        
        # Set up mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        count_chain.eq.return_value = count_chain
        mock_table.select.return_value.eq.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        data_chain.order.return_value = data_chain
        mock_table.select.return_value.eq.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        response = client.get("/procedure-prices/", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert "items" in data
        assert len(data["items"]) > 0
        assert data["total"] == 1


def test_get_procedure_price(mock_auth, auth_headers):
    """Test getting a specific procedure price"""
    with patch('app.routes.procedure_prices_route.supabase') as mock_supabase:
        # Mock response
        mock_response = create_mock_response([MOCK_PROCEDURE_PRICE])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get(f"/procedure-prices/{MOCK_PROCEDURE_PRICE['id']}", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == MOCK_PROCEDURE_PRICE["id"]
        assert data["procedure_id"] == MOCK_PROCEDURE_PRICE["procedure_id"]
        assert data["medical_plan_id"] == MOCK_PROCEDURE_PRICE["medical_plan_id"]
        assert data["price"] == MOCK_PROCEDURE_PRICE["price"]


def test_get_nonexistent_procedure_price(mock_auth, auth_headers):
    """Test getting a procedure price that doesn't exist"""
    with patch('app.routes.procedure_prices_route.supabase') as mock_supabase:
        # Create a mock response with empty data
        mock_empty_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get("/procedure-prices/999", headers=auth_headers)
        assert response.status_code == 404
        assert response.json()["detail"]["code"] == "not_found"


def test_update_procedure_price(mock_auth, auth_headers):
    """Test updating a procedure price"""
    with patch('app.routes.procedure_prices_route.supabase') as mock_supabase:
        # Mock check responses
        mock_check_response = create_mock_response([MOCK_PROCEDURE_PRICE])
        
        # Mock update response
        updated_price = {**MOCK_PROCEDURE_PRICE, "price": 150.00}
        mock_update_response = create_mock_response([updated_price])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_update_response
        mock_supabase.table.return_value = mock_table
        
        response = client.put(
            f"/procedure-prices/{MOCK_PROCEDURE_PRICE['id']}",
            json={
                "procedure_id": 1,
                "medical_plan_id": 1,
                "price": 150.00
            },
            headers=auth_headers
        )
        
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == MOCK_PROCEDURE_PRICE["id"]
        assert data["price"] == 150.00


def test_delete_procedure_price(mock_auth, auth_headers):
    """Test soft deleting a procedure price"""
    with patch('app.routes.procedure_prices_route.supabase') as mock_supabase:
        # Mock check response
        mock_check_response = create_mock_response([MOCK_PROCEDURE_PRICE])
        
        # Mock update/delete response
        mock_delete_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_delete_response
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(f"/procedure-prices/{MOCK_PROCEDURE_PRICE['id']}", headers=auth_headers)
        assert response.status_code == 204


def test_delete_nonexistent_procedure_price(mock_auth, auth_headers):
    """Test deleting a procedure price that doesn't exist"""
    with patch('app.routes.procedure_prices_route.supabase') as mock_supabase:
        # Create a mock response with empty data
        mock_empty_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.delete("/procedure-prices/999", headers=auth_headers)
        assert response.status_code == 404
        assert response.json()["detail"]["code"] == "not_found"
