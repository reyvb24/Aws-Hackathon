import logging
import uuid
from datetime import timedelta

from flask import Flask
from flask_jwt_extended import JWTManager  # type: ignore
from flask_mongoengine import MongoEngine  # type: ignore

from config import Config
from context import ServiceContext
from endpoints import get_endpoints
from helpers.errors import (BadRequestError, InternalServerError, SchemaValidationError,
                            UnauthorizedError, UserExistsError, UsersNotFoundError,
                            handle_exception)
from server_framework.dispatching_view import DispatchingView


class Server(object):
    def __init__(self):
        self.logger = logging.getLogger('goaldigger.server')
        self.db = MongoEngine()

    def create_config(self) -> Config:
        return Config()

    def create_app(self, config) -> Flask:
        app = Flask(__name__)

        app.config.from_object(config)

        app.secret_key = config.SECRET_KEY

        self.db.init_app(app)

        context = ServiceContext(config)
        endpoints_bindings = get_endpoints()

        for endpoint in endpoints_bindings:
            name = 'view-%s' % uuid.uuid4().hex
            app.add_url_rule(
                rule=endpoint.url_pattern,
                methods=(
                    'OPTIONS',
                    'HEAD',
                    'GET',
                    'POST',
                    'PUT',
                    'PATCH',
                    'DELETE'),
                view_func=DispatchingView.as_view(
                    name=name,
                    binding=endpoint,
                    context=context))

        app.register_error_handler(UsersNotFoundError, handle_exception)
        app.register_error_handler(InternalServerError, handle_exception)
        app.register_error_handler(UserExistsError, handle_exception)
        app.register_error_handler(SchemaValidationError, handle_exception)
        app.register_error_handler(UnauthorizedError, handle_exception)
        app.register_error_handler(BadRequestError, handle_exception)

        # JWT Setup
        app.config["JWT_EXPIRATION_DELTA"] = timedelta(seconds=3600)  # 1 hour
        app.config["JWT_AUTH_USERNAME_KEY"] = "email"
        JWTManager(app)
        return app
