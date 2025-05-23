from unittest.mock import patch, MagicMock
import pytest
from datetime import datetime, timezone, timedelta
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

# Mock data
MOCK_USER = {
    "id": "test-user-id",
    "email": "test@example.com"
}

MOCK_TOKEN = "mock-jwt-token"

MOCK_APPOINTMENT = {
    "id": 1,
    "patient_id": 1,
    "professional_id": 1,
    "start_date": (datetime.now(timezone.utc) + timedelta(days=1)).isoformat(),
    "end_date": (datetime.now(timezone.utc) + timedelta(days=1, hours=1)).isoformat(),
    "description": "Test appointment",
    "medical_plan_id": 1,
    "is_paid": False,
    "cost": 100.00,
    "created_at": datetime.now(timezone.utc).isoformat(),
    "is_deleted": False
}


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


def test_create_appointment_unauthorized():
    """Test creating appointment without authentication"""
    response = client.post("/appointments/", json={
        "patient_id": 1,
        "professional_id": 1,
        "start_date": (datetime.now(timezone.utc) + timedelta(days=1)).isoformat(),
        "end_date": (datetime.now(timezone.utc) + timedelta(days=1, hours=1)).isoformat()
    })
    assert response.status_code == 403
    assert "Not authenticated" in response.json()["detail"]


def test_create_appointment_overlap(mock_auth, auth_headers):
    """Test creating appointment with overlapping time"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock responses
        patient_response = create_mock_response([{"id": 1}])
        professional_response = create_mock_response([{"id": 1}])
        medical_plan_response = create_mock_response([{"id": 1}])
        overlap_check_response = create_mock_response([{"id": 2}])  # Existing appointment
        
        # Set up mock table
        mock_table = MagicMock()
        
        def select_side_effect(*args, **kwargs):
            if "a_patients" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.execute.return_value = patient_response
                return chain
            elif "a_professionals" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.execute.return_value = professional_response
                return chain
            elif "a_medical_plans" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.execute.return_value = medical_plan_response
                return chain
            elif "a_appointment" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.eq.return_value.lte.return_value.gte.return_value.execute.return_value = overlap_check_response
                return chain
            return MagicMock()

        mock_table.select.side_effect = select_side_effect
        mock_supabase.table.return_value = mock_table
        
        response = client.post(
            "/appointments/",
            json={
                "patient_id": 1,
                "professional_id": 1,
                "start_date": (datetime.now(timezone.utc) + timedelta(days=1)).isoformat(),
                "end_date": (datetime.now(timezone.utc) + timedelta(days=1, hours=1)).isoformat(),
                "description": "Test appointment",
                "medical_plan_id": 1,
                "cost": 100.00
            },
            headers=auth_headers
        )
        
        assert response.status_code == 409
        data = response.json()
        assert data["detail"]["code"] == "appointment_overlap"


def test_create_appointment_invalid_references(mock_auth, auth_headers):
    """Test creating appointment with invalid patient or professional IDs"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock empty responses for invalid IDs
        empty_response = create_mock_response([])
        
        # Set up mock table
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.post(
            "/appointments/",
            json={
                "patient_id": 999,  # Non-existent ID
                "professional_id": 999,  # Non-existent ID
                "start_date": (datetime.now(timezone.utc) + timedelta(days=1)).isoformat(),
                "end_date": (datetime.now(timezone.utc) + timedelta(days=1, hours=1)).isoformat(),
                "description": "Test appointment",
                "medical_plan_id": 1,
                "cost": 100.00
            },
            headers=auth_headers
        )
        
        assert response.status_code == 404
        data = response.json()
        assert data["detail"]["code"] == "not_found"


def test_list_appointments(mock_auth, auth_headers):
    """Test listing appointments with filters"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock responses
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([MOCK_APPOINTMENT])
        
        # Set up mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        count_chain.eq.return_value = count_chain
        mock_table.select.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        data_chain.order.return_value = data_chain
        mock_table.select.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        response = client.get(
            "/appointments/?patient_id=1&professional_id=1&is_paid=false",
            headers=auth_headers
        )
        
        assert response.status_code == 200
        data = response.json()
        assert "items" in data
        assert len(data["items"]) > 0
        assert data["total"] == 1


def test_list_appointments_date_filter(mock_auth, auth_headers):
    """Test listing appointments with date range filter"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock responses
        mock_count = create_mock_response(None, count=1)
        mock_data = create_mock_response([MOCK_APPOINTMENT])
        
        # Set up mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        count_chain.eq.return_value = count_chain
        count_chain.gte.return_value = count_chain
        count_chain.lte.return_value = count_chain
        mock_table.select.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        data_chain.order.return_value = data_chain
        data_chain.gte.return_value = data_chain
        data_chain.lte.return_value = data_chain
        mock_table.select.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        # Test with date range
        start_date = datetime.now(timezone.utc).isoformat()
        end_date = (datetime.now(timezone.utc) + timedelta(days=7)).isoformat()
        
        response = client.get(
            f"/appointments/?start_date={start_date}&end_date={end_date}",
            headers=auth_headers
        )
        
        assert response.status_code == 200
        data = response.json()
        assert "items" in data
        assert len(data["items"]) > 0


def test_list_appointments_pagination(mock_auth, auth_headers):
    """Test appointment list pagination"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Create multiple mock appointments
        mock_appointments = [
            {**MOCK_APPOINTMENT, "id": i} for i in range(1, 11)
        ]
        
        # Mock responses
        mock_count = create_mock_response(None, count=len(mock_appointments))
        mock_data = create_mock_response(mock_appointments[:5])  # First page
        
        # Set up mock table
        mock_table = MagicMock()
        
        # Set up count query chain
        count_chain = MagicMock()
        count_chain.execute.return_value = mock_count
        count_chain.eq.return_value = count_chain
        mock_table.select.return_value = count_chain
        
        # Set up data query chain
        data_chain = MagicMock()
        data_chain.range.return_value.execute.return_value = mock_data
        data_chain.order.return_value = data_chain
        mock_table.select.return_value.order.return_value = data_chain
        
        mock_supabase.table.return_value = mock_table
        
        # Test first page
        response = client.get(
            "/appointments/?page=1&size=5",
            headers=auth_headers
        )
        
        assert response.status_code == 200
        data = response.json()
        assert len(data["items"]) == 5
        assert data["total"] == 10
        assert data["page"] == 1
        assert data["pages"] == 2


def test_get_appointment(mock_auth, auth_headers):
    """Test getting a specific appointment"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock response
        mock_response = create_mock_response([MOCK_APPOINTMENT])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get(f"/appointments/{MOCK_APPOINTMENT['id']}", headers=auth_headers)
        assert response.status_code == 200
        data = response.json()
        assert data["id"] == MOCK_APPOINTMENT["id"]
        assert data["patient_id"] == MOCK_APPOINTMENT["patient_id"]
        assert data["professional_id"] == MOCK_APPOINTMENT["professional_id"]


def test_get_nonexistent_appointment(mock_auth, auth_headers):
    """Test getting an appointment that doesn't exist"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Create a mock response with empty data
        mock_empty_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
        mock_supabase.table.return_value = mock_table
        
        response = client.get("/appointments/999", headers=auth_headers)
        assert response.status_code == 404
        data = response.json()
        assert data["detail"]["code"] == "not_found"


def test_update_appointment_overlap(mock_auth, auth_headers):
    """Test updating appointment causes overlap with existing appointment"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock responses
        existing_response = create_mock_response([MOCK_APPOINTMENT])
        patient_response = create_mock_response([{"id": 1}])
        professional_response = create_mock_response([{"id": 1}])
        medical_plan_response = create_mock_response([{"id": 1}])
        overlap_check_response = create_mock_response([{"id": 2}])  # Another appointment exists
        
        # Set up mock table
        mock_table = MagicMock()
        
        def select_side_effect(*args, **kwargs):
            if "a_appointment" in str(mock_table.mock_calls[-1]):
                if ".neq" in str(mock_table.mock_calls):  # Overlap check
                    chain = MagicMock()
                    chain.eq.return_value.eq.return_value.neq.return_value.lte.return_value.gte.return_value.execute.return_value = overlap_check_response
                    return chain
                else:  # Existence check
                    chain = MagicMock()
                    chain.eq.return_value.execute.return_value = existing_response
                    return chain
            elif "a_patients" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.execute.return_value = patient_response
                return chain
            elif "a_professionals" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.execute.return_value = professional_response
                return chain
            elif "a_medical_plans" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.execute.return_value = medical_plan_response
                return chain
            return MagicMock()
            
        mock_table.select.side_effect = select_side_effect
        mock_supabase.table.return_value = mock_table
        
        response = client.put(
            f"/appointments/{MOCK_APPOINTMENT['id']}",
            json={
                "patient_id": 1,
                "professional_id": 1,
                "start_date": (datetime.now(timezone.utc) + timedelta(days=1)).isoformat(),
                "end_date": (datetime.now(timezone.utc) + timedelta(days=1, hours=1)).isoformat(),
                "description": "Updated appointment",
                "medical_plan_id": 1,
                "cost": 100.00
            },
            headers=auth_headers
        )
        
        assert response.status_code == 409
        data = response.json()
        assert data["detail"]["code"] == "appointment_overlap"


def test_delete_appointment(mock_auth, auth_headers):
    """Test soft deleting an appointment"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock data for appointment check
        mock_check_response = create_mock_response([MOCK_APPOINTMENT])
        mock_delete_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.update.return_value.eq.return_value.execute.return_value = mock_delete_response
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(
            f"/appointments/{MOCK_APPOINTMENT['id']}",
            headers=auth_headers
        )
        
        assert response.status_code == 204


def test_permanent_delete_appointment(mock_auth, auth_headers):
    """Test permanently deleting an appointment"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock data for appointment check
        mock_check_response = create_mock_response([MOCK_APPOINTMENT])
        mock_delete_response = create_mock_response([])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_table.delete.return_value.eq.return_value.execute.return_value = mock_delete_response
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(
            f"/appointments/{MOCK_APPOINTMENT['id']}?permanent=true",
            headers=auth_headers
        )
        
        assert response.status_code == 204


def test_invalid_appointment_dates(mock_auth, auth_headers):
    """Test creating appointment with invalid dates (end before start)"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock patient check
        patient_response = create_mock_response([{"id": 1}])
        professional_response = create_mock_response([{"id": 1}])
        
        # Set up mock table
        mock_table = MagicMock()
        
        def select_side_effect(*args, **kwargs):
            if "a_patients" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.execute.return_value = patient_response
                return chain
            elif "a_professionals" in str(mock_table.mock_calls[-1]):
                chain = MagicMock()
                chain.eq.return_value.execute.return_value = professional_response
                return chain
            return MagicMock()

        mock_table.select.side_effect = select_side_effect
        mock_supabase.table.return_value = mock_table
        
        # End date before start date
        response = client.post(
            "/appointments/",
            json={
                "patient_id": 1,
                "professional_id": 1,
                "start_date": (datetime.now(timezone.utc) + timedelta(days=1)).isoformat(),
                "end_date": datetime.now(timezone.utc).isoformat(),  # End before start
                "description": "Test appointment"
            },
            headers=auth_headers
        )
        
        assert response.status_code == 400
        data = response.json()
        assert data["detail"]["code"] == "invalid_dates"


def test_delete_past_appointment(mock_auth, auth_headers):
    """Test attempting to delete a past appointment"""
    with patch('app.routes.appointments_route.supabase') as mock_supabase:
        # Mock data for past appointment
        past_appointment = {
            **MOCK_APPOINTMENT,
            "start_date": (datetime.now(timezone.utc) - timedelta(days=1)).isoformat(),
            "end_date": (datetime.now(timezone.utc) - timedelta(days=1, hours=1)).isoformat()
        }
        mock_check_response = create_mock_response([past_appointment])
        
        # Set up mock
        mock_table = MagicMock()
        mock_table.select.return_value.eq.return_value.execute.return_value = mock_check_response
        mock_supabase.table.return_value = mock_table
        
        response = client.delete(
            f"/appointments/{MOCK_APPOINTMENT['id']}",
            headers=auth_headers
        )
        
        assert response.status_code == 400
        data = response.json()
        assert data["detail"]["code"] == "past_appointment"
