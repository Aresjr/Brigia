import sys
import os
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

@pytest.fixture
def client():
    return TestClient(app)
