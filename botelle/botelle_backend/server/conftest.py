import pytest
from mongoengine import connect


@pytest.fixture(scope="session", autouse=True)
def mongoengine_connection(request):
    connect(db='mongotest', host='mongomock://localhost')
