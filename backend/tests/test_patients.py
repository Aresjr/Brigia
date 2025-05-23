from unittest.mock import patch, MagicMock
import pytest
from datetime import datetime, timezone, date
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

# Mock data
MOCK_USER = {
    "id": "test-user-id",
    "email": "test@example.com"
}

MOCK_PATIENT = {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "cpf": "12345678901",
    "birth_date": "1990-01-01",
    "sex": "M",
    "cellphone": "11999999999",
    "created_at": datetime.now(timezone.utc).isoformat(),
    "last_appointment": None,
    "next_appointment": None,
    "is_deleted": False,
    "image_url": None,
    "identification_color": None,
    "address_cep": "12345678",
    "address_rua": "Test Street",
    "address_complemento": "Apt 123",
    "address_bairro": "Test Neighborhood",
    "address_cidade": "Test City",
    "address_uf": "SP",
    "medical_plan_id": 1
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

def create_mock_response(data, count=None):
    """Helper function to create a mock response with proper data structure"""
    mock_response = MagicMock()
    mock_response.data = data
    if count is not None:
        mock_response.count = count
    return mock_response

@pytest.fixture
def mock_supabase():
    """Mock Supabase client responses"""
    with patch('app.routes.patients.supabase') as mock:
        # Create default data response
        mock_data_response = create_mock_response([MOCK_PATIENT])
        mock_count_response = create_mock_response([], count=1)
        
        # Mock table operations
        mock_table = MagicMock()
        
        # For insert operations
        mock_table.insert.return_value.execute.return_value = mock_data_response
        
        # For select operations
        select_chain = MagicMock()
        select_chain.execute.return_value = mock_count_response
        select_chain.eq.return_value.execute.return_value = mock_count_response
        select_chain.eq.return_value.range.return_value.execute.return_value = mock_data_response
        mock_table.select.return_value = select_chain
        
        # For update operations
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_data_response
        
        # For delete operations
        mock_table.delete.return_value.eq.return_value.execute.return_value = create_mock_response([])
        
        mock.table.return_value = mock_table
        yield mock

def test_create_patient_unauthorized():
    """Test creating patient without authentication"""
    response = client.post("/patients/", json={
        "name": "Test Patient",
        "email": "test@example.com"
    })
    assert response.status_code == 403
    assert "Not authenticated" in response.json()["detail"]

def test_create_patient(mock_auth, mock_supabase, auth_headers):
    """Test successful patient creation"""
    response = client.post(
        "/patients/",
        json={
            "name": "Test Patient",
            "email": "test@example.com",
            "cpf": "12345678901",
            "birth_date": "1990-01-01",
            "sex": "M"
        },
        headers=auth_headers
    )
    assert response.status_code == 201
    data = response.json()
    assert data["name"] == MOCK_PATIENT["name"]
    assert not data["is_deleted"]

def test_create_patient_duplicate_email(mock_auth, mock_supabase, auth_headers):
    """Test creating patient with duplicate email"""
    # Create table mock with custom execute method
    mock_table = MagicMock()
    mock_table.insert.return_value.execute.side_effect = \
        Exception('duplicate key value violates unique constraint "patients_email_key"')
    mock_supabase.table.return_value = mock_table
    
    response = client.post(
        "/patients/",
        json={
            "name": "Test Patient",
            "email": "existing@example.com",
        },
        headers=auth_headers
    )
    assert response.status_code == 409
    error = response.json()["detail"]
    assert error["code"] == "email_already_exists"
    assert error["field"] == "email"

def test_list_patients(mock_auth, auth_headers):
    """Test listing patients with pagination"""
    with patch('app.routes.patients.supabase') as mock_supabase:
        patient_data = {
            "id": 1,
            "name": "Test Patient",
            "email": "test@example.com",
            "cpf": "12345678901",
            "birth_date": "1990-01-01",
            "sex": "M",
            "cellphone": "11999999999",
            "created_at": datetime.now(timezone.utc).isoformat(),
            "last_appointment": None,
            "next_appointment": None,
            "is_deleted": False,
            "image_url": None,
            "identification_color": None,
            "address_cep": None,
            "address_rua": None,
            "address_complemento": None,
            "address_bairro": None,
            "address_cidade": None,
            "address_uf": None,
            "medical_plan_id": None
        }
        
        # Set up mock responses
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([patient_data])
        
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
        
        # Test list
        response = client.get("/patients/", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert "items" in data
        assert len(data["items"]) > 0
        assert data["total"] == 1

def test_list_patients_with_filters(mock_auth, auth_headers):
    """Test listing patients with medical plan filter"""
    with patch('app.routes.patients.supabase') as mock_supabase:
        patient_data = {
            "id": 1,
            "name": "Test Patient",
            "email": "test@example.com",
            "cpf": "12345678901",
            "birth_date": "1990-01-01",
            "sex": "M",
            "cellphone": "11999999999",
            "created_at": datetime.now(timezone.utc).isoformat(),
            "last_appointment": None,
            "next_appointment": None,
            "is_deleted": False,
            "image_url": None,
            "identification_color": None,
            "address_cep": None,
            "address_rua": None,
            "address_complemento": None,
            "address_bairro": None,
            "address_cidade": None,
            "address_uf": None,
            "medical_plan_id": 1
        }
        
        # Set up mock responses
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([patient_data])
        
        # Set up the mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        count_chain.eq.return_value = count_chain
        mock_table.select.return_value.eq.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        data_chain.eq.return_value = data_chain
        mock_table.select.return_value.eq.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        # Test list with filters
        response = client.get("/patients/?medical_plan_id=1&is_deleted=false", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert "items" in data
        assert len(data["items"]) > 0
        assert data["items"][0]["medical_plan_id"] == 1

def test_get_patient(mock_auth, mock_supabase, auth_headers):
    """Test getting a specific patient"""
    with patch('app.routes.patients.supabase') as mock_supabase:
        # Mock data
        patient_data = {
            "id": 1,
            "name": "Test Patient",
            "email": "test@example.com",
            "cpf": "12345678901",
            "birth_date": "1990-01-01",
            "sex": "M",
            "cellphone": "11999999999",
            "created_at": datetime.now(timezone.utc).isoformat(),
            "last_appointment": None,
            "next_appointment": None,
            "is_deleted": False,
            "image_url": None,
            "identification_color": None,
            "address_cep": None,
            "address_rua": None,
            "address_complemento": None,
            "address_bairro": None,
            "address_cidade": None,
            "address_uf": None,
            "medical_plan_id": None
        }
        
        # Set up mock response
        mock_response = create_mock_response([patient_data])
        
        # Set up the mock chain
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get(f"/patients/{patient_data['id']}", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == patient_data["id"]
        assert data["name"] == patient_data["name"]

def test_get_nonexistent_patient(mock_auth, mock_supabase, auth_headers):
    """Test getting a patient that doesn't exist"""
    # Create a mock response with empty data
    mock_empty_response = MagicMock()
    mock_empty_response.data = []
    
    # Set up the mock chain
    mock_table = MagicMock()
    mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
    mock_supabase.table.return_value = mock_table
    
    response = client.get("/patients/999", headers=auth_headers)
    assert response.status_code == 404
    assert "not found" in response.json()["detail"].lower()

def test_update_patient(mock_auth, mock_supabase, auth_headers):
    """Test updating a patient"""
    with patch('app.routes.patients.supabase') as mock_supabase:
        # Mock data
        patient_data = {
            "id": 1,
            "name": "Updated Name",
            "email": "updated@example.com",
            "cpf": "12345678901",
            "birth_date": "1990-01-01",
            "sex": "M",
            "cellphone": "11988888888",
            "created_at": datetime.now(timezone.utc).isoformat(),
            "last_appointment": None,
            "next_appointment": None,
            "is_deleted": False,
            "image_url": None,
            "identification_color": None,
            "address_cep": None,
            "address_rua": None,
            "address_complemento": None,
            "address_bairro": None,
            "address_cidade": None,
            "address_uf": None,
            "medical_plan_id": None
        }
        
        # Set up mock responses
        mock_get_response = create_mock_response([patient_data])  # For the existence check
        mock_update_response = create_mock_response([patient_data])  # For the update operation
        
        # Set up the mock chain
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_get_response
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_update_response
        mock_supabase.table.return_value = mock_table
        
        response = client.put(
            f"/patients/{patient_data['id']}",
            json={
                "name": "Updated Name",
                "email": "updated@example.com",
                "cellphone": "11988888888"
            },
            headers=auth_headers
        )
        assert response.status_code == 200
        data = response.json()
        assert data["name"] == "Updated Name"
        assert data["email"] == "updated@example.com"
        assert data["cellphone"] == "11988888888"

def test_update_nonexistent_patient(mock_auth, mock_supabase, auth_headers):
    """Test updating a patient that doesn't exist"""
    # Create a mock response with empty data
    mock_empty_response = MagicMock()
    mock_empty_response.data = []
    
    # Set up the mock chain
    mock_table = MagicMock()
    mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
    mock_supabase.table.return_value = mock_table
    
    response = client.put(
        "/patients/999",
        json={
            "name": "Updated Name",
            "email": "updated@example.com"
        },
        headers=auth_headers
    )
    assert response.status_code == 404
    error = response.json()["detail"]
    assert error["code"] == "patient_not_found"

def test_delete_patient(mock_auth, mock_supabase, auth_headers):
    """Test soft deleting a patient"""
    with patch('app.routes.patients.supabase') as mock_supabase:
        # Mock data for patient check
        mock_check_response = create_mock_response([MOCK_PATIENT])
        
        # Mock data for delete operation
        mock_delete_response = create_mock_response([])
        
        # Set up the mock chain
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_delete_response
        
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(
            f"/patients/{MOCK_PATIENT['id']}",
            headers=auth_headers
        )
        assert response.status_code == 204

def test_permanent_delete_patient(mock_auth, mock_supabase, auth_headers):
    """Test permanently deleting a patient"""
    with patch('app.routes.patients.supabase') as mock_supabase:
        # Mock data for patient check
        mock_check_response = create_mock_response([MOCK_PATIENT])
        
        # Mock data for delete operation
        mock_delete_response = create_mock_response([])
        
        # Set up the mock chain
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.delete.return_value.eq.return_value.execute.return_value = mock_delete_response
        
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(
            f"/patients/{MOCK_PATIENT['id']}?permanent=true",
            headers=auth_headers
        )
        assert response.status_code == 204

def test_invalid_patient_data(mock_auth, auth_headers):
    """Test creating a patient with invalid data"""
    response = client.post(
        "/patients/",
        json={
            "email": "invalid"  # Invalid email format
        },
        headers=auth_headers
    )
    assert response.status_code == 422

def test_invalid_sex_value(mock_auth, auth_headers):
    """Test creating a patient with invalid sex value"""
    response = client.post(
        "/patients/",
        json={
            "name": "Test Patient",
            "email": "test@example.com",
            "sex": "X"  # Only M or F allowed
        },
        headers=auth_headers
    )
    assert response.status_code == 422

def test_list_patients_pagination(mock_auth, auth_headers):
    """Test paginated list of patients with various parameters"""
    mock_patients = [
        {**MOCK_PATIENT, "id": i, "name": f"Patient {i}", "email": f"patient{i}@example.com"}
        for i in range(1, 26)  # Create 25 mock patients
    ]
    
    with patch('app.routes.patients.supabase') as mock_supabase:
        # Mock the count query
        mock_count = MagicMock()
        mock_count.count = 25
        mock_count_execute = MagicMock(return_value=mock_count)
        
        # Mock the data query
        mock_data_response = MagicMock()
        mock_data_response.data = mock_patients[:10]
        mock_data_execute = MagicMock(return_value=mock_data_response)
        
        # Set up the mock chain for count
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute = mock_count_execute
        
        # Set up the mock chain for data
        mock_table.select.return_value.eq.return_value.order.return_value.range.return_value.execute = mock_data_execute
        
        mock_supabase.table.return_value = mock_table
        
        # Test first page
        response = client.get("/patients/?page=1&size=10", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert data["total"] == 25
        assert data["page"] == 1
        assert data["size"] == 10
        assert data["pages"] == 3
        assert len(data["items"]) == 10

def test_search_patients(mock_auth, auth_headers):
    """Test patient search functionality"""
    with patch('app.routes.patients.supabase') as mock_supabase:
        patient_data = {
            "id": 1,
            "name": "John Smith",
            "email": "john@example.com",
            "cpf": "12345678901",
            "birth_date": "1990-01-01",
            "sex": "M",
            "cellphone": "11999999999",
            "created_at": datetime.now(timezone.utc).isoformat(),
            "last_appointment": None,
            "next_appointment": None,
            "is_deleted": False,
            "image_url": None,
            "identification_color": None,
            "address_cep": None,
            "address_rua": None,
            "address_complemento": None,
            "address_bairro": None,
            "address_cidade": None,
            "address_uf": None,
            "medical_plan_id": None
        }
        
        # Set up mock responses
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([patient_data])
        
        # Set up the mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        count_chain.or_.return_value = count_chain
        mock_table.select.return_value.eq.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        data_chain.or_.return_value = data_chain
        mock_table.select.return_value.eq.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        # Test search
        response = client.get("/patients/?search=John", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert len(data["items"]) == 1
        assert "John" in data["items"][0]["name"]

def test_list_patients_ordering(mock_auth, auth_headers):
    """Test patient list ordering"""
    with patch('app.routes.patients.supabase') as mock_supabase:
        # Mock ordered data
        mock_patients = [
            {
                "id": 1,
                "name": "Alice",
                "email": "alice@example.com",
                "cpf": "12345678901",
                "birth_date": "1990-01-01",
                "sex": "F",
                "cellphone": "11999999999",
                "created_at": datetime.now(timezone.utc).isoformat(),
                "last_appointment": None,
                "next_appointment": None,
                "is_deleted": False,
                "image_url": None,
                "identification_color": None,
                "address_cep": None,
                "address_rua": None,
                "address_complemento": None,
                "address_bairro": None,
                "address_cidade": None,
                "address_uf": None,
                "medical_plan_id": None
            },
            {
                "id": 2,
                "name": "Bob",
                "email": "bob@example.com",
                "cpf": "98765432101",
                "birth_date": "1990-01-01",
                "sex": "M",
                "cellphone": "11988888888",
                "created_at": datetime.now(timezone.utc).isoformat(),
                "last_appointment": None,
                "next_appointment": None,
                "is_deleted": False,
                "image_url": None,
                "identification_color": None,
                "address_cep": None,
                "address_rua": None,
                "address_complemento": None,
                "address_bairro": None,
                "address_cidade": None,
                "address_uf": None,
                "medical_plan_id": None
            }
        ]
        
        # Mock the count query
        mock_count = create_mock_response([], count=2)
        
        # Mock the data query
        mock_data = create_mock_response(mock_patients)
        
        # Set up the mock chain
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_count
        mock_table.select.return_value.eq.return_value.order.return_value.range.return_value.execute.return_value = mock_data
        mock_supabase.table.return_value = mock_table
        
        # Test name ascending order
        response = client.get("/patients/?order_by=name", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert data["items"][0]["name"] == "Alice"
        assert data["items"][1]["name"] == "Bob"
