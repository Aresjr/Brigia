import sys
import os
from unittest.mock import patch, MagicMock

import pytest
from fastapi.testclient import TestClient

# Add the parent directory to Python path first
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from app.main import app  # Now we can import using the absolute import

@pytest.fixture(autouse=True)
def setup_test_environment():
    """Automatically set up test environment variables before each test"""
    os.environ["ENV"] = "test"
    os.environ["FRONTEND_PORT"] = "5173"  # Default Vite dev port
    os.environ["SUPABASE_PROJECT_ID"] = "test_project_id"
    os.environ["SUPABASE_JWT_SECRET"] = "test_jwt_secret"
    yield
    # Clean up after tests
    os.environ.pop("ENV", None)
    os.environ.pop("FRONTEND_PORT", None)
    os.environ.pop("SUPABASE_PROJECT_ID", None)
    os.environ.pop("SUPABASE_JWT_SECRET", None)

@pytest.fixture(autouse=True)
def mock_supabase():
    """Mock the entire Supabase client with general fallback behavior."""
    with patch("app.supabase.create_client") as mock_create_client:
        mock_client = MagicMock()

        # General catch-all mock response
        mock_response = MagicMock()
        mock_response.data = [{"mocked": "value"}]
        mock_response.error = None

        # Any call chain like .from_().select().eq().execute() will return mock_response
        mock_client.from_.return_value.select.return_value.eq.return_value.execute.return_value = mock_response

        # Assign to the create_client return value
        mock_create_client.return_value = mock_client

        yield mock_client

@pytest.fixture
def client():
    return TestClient(app)
