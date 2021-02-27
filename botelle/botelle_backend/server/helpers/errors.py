import json

from flask import Response


class ResourceNotFoundError(Exception):
    code = 404
    name = "ResourceNotFound"
    description = "Resource with a given id is not found."


class UsersNotFoundError(Exception):
    code = 404
    name = "UsersNotFoundError"
    description = "users with the given id are not found."


class InternalServerError(Exception):
    code = 500
    name = "InternalServerError"
    description = "something unexpected happened"


class UserExistsError(Exception):
    code = 409
    name = "UserExistError"
    description = "User with the given email id exist."


class SchemaValidationError(Exception):
    code = 400
    name = "SchemaValidationError"
    description = "keywords is missing required fields."


class UnauthorizedError(Exception):
    code = 401
    name = "UnauthorizedError"
    description = "User is not authorized to access."


class BadRequestError(Exception):
    code = 401
    name = "BadRequestError"
    description = "Bad Request"


def handle_exception(e):
    response = Response()
    response.data = json.dumps({
        "code": e.code,
        "name": e.name,
        "description": e.description,
    })
    response.content_type = "application/json"
    return response
