from unittest.mock import patch, MagicMock
from datetime import datetime, timezone
import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

# Mock user and session data
MOCK_USER = {
    "id": "test-user-id",
    "email": "test@example.com"
}

MOCK_SESSION = {
    "access_token": "fake-access-token",
    "token_type": "bearer"
}

MOCK_PROFILE = {
    "id": 1,
    "user_id": MOCK_USER["id"],
    "name": "Test User",
    "avatar_url": None,
    "establishment": None,
    "role": "user",
    "theme": "light",
    "language": "en",
    "created_at": datetime.now(timezone.utc).isoformat(),
    "updated_at": datetime.now(timezone.utc).isoformat(),
    "is_deleted": False
}


def create_mock_response(data, count=None):
    """Create a mock response object"""
    mock_response = MagicMock()
    mock_response.data = data
    mock_response.count = count
    return mock_response


@pytest.fixture(autouse=True)
def mock_supabase():
    """Create a base mock for Supabase client"""
    mock_client = MagicMock()
    with patch('app.routes.auth_route.supabase', mock_client):
        yield mock_client


def test_login_success(mock_supabase):
    """Test successful login attempt with profile"""
    # Create mock user and session in the format expected by Supabase
    class MockUser:
        @property
        def id(self):
            return MOCK_USER["id"]
        @property
        def email(self):
            return MOCK_USER["email"]

    class MockSession:
        @property
        def access_token(self):
            return MOCK_SESSION["access_token"]
        @property
        def token_type(self):
            return MOCK_SESSION["token_type"]

    class MockAuthResponse:
        def __init__(self):
            self.user = MockUser()
            self.session = MockSession()

    # Set up auth mock
    mock_auth_response = MockAuthResponse()
    mock_supabase.auth.sign_in_with_password.return_value = mock_auth_response

    # Set up profile mock
    mock_profile_response = create_mock_response([MOCK_PROFILE])
    mock_table = MagicMock()
    mock_table.select.return_value.eq.return_value.execute.return_value = mock_profile_response
    mock_supabase.table.return_value = mock_table

    response = client.post(
        "/auth/login",
        json={"email": "test@example.com", "password": "test-password"}
    )
    
    assert response.status_code == 200
    data = response.json()
    assert data["access_token"] == "fake-access-token"
    assert data["token_type"] == "bearer"
    assert data["user"]["email"] == "test@example.com"
    assert data["user"]["id"] == "test-user-id"

    # Validate profile data
    assert "profile" in data["user"]
    profile = data["user"]["profile"]
    assert profile["id"] == MOCK_PROFILE["id"]
    assert profile["user_id"] == MOCK_PROFILE["user_id"]
    assert profile["name"] == MOCK_PROFILE["name"]
    assert profile["role"] == MOCK_PROFILE["role"]
    assert profile["theme"] == MOCK_PROFILE["theme"]
    assert profile["language"] == MOCK_PROFILE["language"]


def test_login_with_profile_creation(mock_supabase):
    """Test login when profile doesn't exist (should create default profile)"""
    # Create mock user and session
    class MockUser:
        @property
        def id(self):
            return MOCK_USER["id"]
        @property
        def email(self):
            return MOCK_USER["email"]

    class MockSession:
        @property
        def access_token(self):
            return MOCK_SESSION["access_token"]
        @property
        def token_type(self):
            return MOCK_SESSION["token_type"]

    class MockAuthResponse:
        def __init__(self):
            self.user = MockUser()
            self.session = MockSession()

    # Set up auth mock
    mock_auth_response = MockAuthResponse()
    mock_supabase.auth.sign_in_with_password.return_value = mock_auth_response

    # Set up profile mock - first query returns no profile
    mock_empty_response = create_mock_response([])
    mock_new_profile = {**MOCK_PROFILE, "name": "test"}  # Default name from email
    mock_create_response = create_mock_response([mock_new_profile])
    
    # Set up mock table
    mock_table = MagicMock()
    mock_table.select.return_value.eq.return_value.execute.return_value = mock_empty_response
    mock_table.insert.return_value.execute.return_value = mock_create_response
    mock_supabase.table.return_value = mock_table

    # Test login
    response = client.post(
        "/auth/login",
        json={
            "email": "test@example.com",
            "password": "password123"
        }
    )
    
    assert response.status_code == 200
    data = response.json()
    
    # Validate response structure
    assert data["access_token"] == MOCK_SESSION["access_token"]
    assert data["token_type"] == MOCK_SESSION["token_type"]
    assert data["user"]["id"] == MOCK_USER["id"]
    assert data["user"]["email"] == MOCK_USER["email"]
    
    # Validate profile data
    assert "profile" in data["user"]
    profile = data["user"]["profile"]
    assert profile["id"] == mock_new_profile["id"]
    assert profile["user_id"] == mock_new_profile["user_id"]
    assert profile["role"] == "user"  # Default role
    assert profile["theme"] == "light"  # Default theme
    assert profile["language"] == "en"  # Default language


def test_login_invalid_credentials(mock_supabase):
    """Test login with invalid credentials"""
    # Mock auth failure
    mock_supabase.auth.sign_in_with_password.side_effect = Exception("Invalid credentials")
    
    response = client.post(
        "/auth/login",
        json={
            "email": "test@example.com",
            "password": "wrongpassword"
        }
    )
    
    assert response.status_code == 401
    data = response.json()
    assert data["detail"]["code"] == "invalid_credentials"
    assert data["detail"]["message"] == "Invalid credentials"


def test_login_profile_error(mock_supabase):
    """Test login when profile retrieval fails"""
    # Create mock user and session
    class MockUser:
        @property
        def id(self):
            return MOCK_USER["id"]
        @property
        def email(self):
            return MOCK_USER["email"]

    class MockSession:
        @property
        def access_token(self):
            return MOCK_SESSION["access_token"]
        @property
        def token_type(self):
            return MOCK_SESSION["token_type"]

    class MockAuthResponse:
        def __init__(self):
            self.user = MockUser()
            self.session = MockSession()

    # Set up auth mock
    mock_auth_response = MockAuthResponse()
    mock_supabase.auth.sign_in_with_password.return_value = mock_auth_response

    # Set up profile mock to fail both select and insert
    mock_table = MagicMock()
    mock_table.select.return_value.eq.return_value.execute.side_effect = Exception("Database error")
    mock_table.insert.return_value.execute.side_effect = Exception("Database error")
    mock_supabase.table.return_value = mock_table

    response = client.post(
        "/auth/login",
        json={
            "email": "test@example.com",
            "password": "password123"
        }
    )
    
    assert response.status_code == 500
    data = response.json()
    assert data["detail"]["code"] == "profile_error"
    assert "Failed to retrieve user profile" in data["detail"]["message"]


def test_login_failure(mock_supabase):
    """Test failed login attempt"""
    mock_supabase.auth.sign_in_with_password.side_effect = Exception("Invalid credentials")
    
    response = client.post(
        "/auth/login",
        json={"email": "wrong@example.com", "password": "wrong-password"}
    )
    
    assert response.status_code == 401
    data = response.json()
    assert data["detail"]["code"] == "invalid_credentials"
    assert data["detail"]["message"] == "Invalid credentials"

def test_login_invalid_payload():
    """Test login with invalid request payload"""
    response = client.post(
        "/auth/login",
        json={"email": "test@example.com"}  # Missing password
    )
    
    assert response.status_code == 422  # Validation error

def test_login_empty_credentials():
    """Test login with empty credentials"""
    response = client.post(
        "/auth/login",
        json={"email": "", "password": ""}
    )
    
    assert response.status_code == 422
    data = response.json()
    error_messages = [error["msg"].lower() for error in data["detail"]]
    assert any("email" in msg for msg in error_messages)
