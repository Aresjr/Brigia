import sys
import os
import pytest
from fastapi.testclient import TestClient

from ..app.main import app

sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

@pytest.fixture
def client():
    return TestClient(app)
