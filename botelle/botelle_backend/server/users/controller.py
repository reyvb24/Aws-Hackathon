import bcrypt
from flask import jsonify, request
from flask_api import status
from flask_jwt_extended import (create_access_token, create_refresh_token,
                                get_jwt_identity, jwt_refresh_token_required,
                                )
from mongoengine import DoesNotExist, NotUniqueError

from helpers.errors import (InternalServerError, UnauthorizedError,
                            UserExistsError, UsersNotFoundError)
from server_framework.controller_layer import ControllerLayer
from users.service import UserService


def hash_password(password):
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(password, salt)


class UserController(ControllerLayer):
    def __init__(self, context):
        super().__init__(context)
        self._log = self.context.logger
        self.user_service = UserService(context)

    @jwt_refresh_token_required
    def get(self):
        userId = get_jwt_identity()
        try:
            user = self.user_service.get_user(userId)
            print("Getting user with userId: {}".format(userId))

            return jsonify(user)
        except DoesNotExist:
            raise UsersNotFoundError
        except Exception as e:
            self._log.exception(f"Exception Occurred in {self.class_name}: {type(e)}")
            raise InternalServerError(f"Exception Occurred in {self.class_name}: {type(e)}")

    def post(self):
        try:
            request_data = request.get_json()
            res = self.user_service.create_user(request_data)

            del res["password"]
            del res["_id"]
            res["access_token"] = create_access_token(identity=res["userId"], fresh=True)
            res["refresh_token"] = create_refresh_token(res["userId"])


            return res, status.HTTP_201_CREATED
        except NotUniqueError:
            raise UserExistsError(f"The user exists {request_data['email']}")
        except Exception as e:
            self._log.exception(f"Exception Occurred in {self.class_name}: {type(e)}")
            raise InternalServerError(f"Exception Occurred in {self.class_name}: {type(e)}")

    @jwt_refresh_token_required
    def patch(self):
        try:
            userId = get_jwt_identity()
            request_data = request.get_json()
            updatedField = {}
            for field, value in request_data.items():
                if field in ["username", "userId", "email", "password"]:
                    print("Unable to update {}".format(field))
                    continue
                updatedField["set__{}".format(field)] = value

            self.user_service.update_user(userId, updatedField)

            self._log.info("Updated user: {}. {}".format(userId, updatedField))
        except NotUniqueError:
            print("The email has been used {}".format(request_data["email"]))
            raise UserExistsError
        except Exception as e:
            self._log.exception(f"Exception Occurred in {self.class_name}: {type(e)}")
            raise InternalServerError(f"Exception Occurred in {self.class_name}: {type(e)}")

        return self.get()

    @jwt_refresh_token_required
    def delete(self):
        userId = get_jwt_identity()
        try:
            self.user_service.delete_user(userId)

            # Delete User Goals
            self.user_goal_service.delete_by_user_id(userId)

            # Delete all goals by user
            self.goal_service.delete_all_goal(userId)

            # Delete all user badges
            self.user_badge_service.delete_user_badges(userId)

            print("Deleting user: {} is successful".format(userId))
            return {'userId': userId}, status.HTTP_200_OK
        except Exception as e:
            self._log.exception(f"Exception Occurred in {self.class_name}: {type(e)}")
            print("Deleting user: {} is unsuccessful".format(userId))
            raise InternalServerError


class UserLogin(ControllerLayer):
    def __init__(self, context):
        super().__init__(context)
        self.user_service = UserService(context)

    # defining the request parser and expected arguments in the request

    def post(self):
        self.parser.add_argument(
            "email", type=str, required=True, help="This field cannot be blank."
        )
        self.parser.add_argument(
            "password", type=str, required=True, help="This field cannot be blank."
        )
        data = self.parser.parse_args()
        try:
            user = self.user_service.get_credential("email", data["email"])
            print("Authenticating user...", user.email)
            if user and bcrypt.checkpw(data["password"], user["password"]):
                print("Authenticated!")
                access_token = create_access_token(identity=user.userId, fresh=True)
                refresh_token = create_refresh_token(user.userId)
                return {"access_token": access_token, "refresh_token": refresh_token}
        except Exception as e:
            self._log.exception(f"Exception Occurred in {self.class_name}: {type(e)}")
            raise InternalServerError(f"Exception Occurred in {self.class_name}: {type(e)}")
        raise UnauthorizedError("Invalid Credentials!")

