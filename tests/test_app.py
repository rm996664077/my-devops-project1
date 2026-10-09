import pytest
from app.app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_home_route(client):
    """Vérifie que la route '/' renvoie un code 200 et le texte 'Hello DevOps'"""
    response = client.get('/')
    assert response.status_code == 200
    assert response.data.decode('utf-8') == "Hello DevOps"

def test_health_route(client):
    """Vérifie que la route '/health' renvoie un code 200 et le JSON {'status': 'OK'}"""
    response = client.get('/health')
    assert response.status_code == 200
    assert response.get_json() == {"status": "OK"}