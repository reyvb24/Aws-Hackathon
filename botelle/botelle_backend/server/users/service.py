import bcrypt
import shortuuid
from firebase_admin import auth

from context import ServiceContext
from helpers.constant import BADGE_TYPE_SETUP
from helpers.jsonEncoder import toJson
from server_framework.service_layer import ServiceLayer
from users.model import Users


# Helper Methods
def hash_password(password):
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(password, salt)


class UserService(ServiceLayer):
    def __init__(self, context: ServiceContext):
        super().__init__(context)

    # Create Methods
    def create_user(self, data):
        user = Users(
            fName=data["fName"],
            lName=data["lName"],
            username=data["username"].lower(),
            userId=shortuuid.uuid(),
            password=hash_password(data["password"]),
            email=data["email"].lower(),
        )
        user.save()

        print(f'Successfully created new user: {user.email}')

        return toJson(user)

    # Get Methods
    def get_user(self, userId):
        user = Users.objects(userId=userId).exclude("password", "id", "created")[0]
        if not user[" ified"]:
            isVerified = auth.get_user(userId).email_verified
            if isVerified:
                self.verify_user(userId)
                user["verified"] = True
        return user


    def get_credential(self, username=None, email=None):
        user = None
        if email:
            user = Users.objects.get(email=email.lower())
        elif username:
            user = Users.objects.get(username=username.lower())
        return user

    # Delete Methods
    def delete_user(self, userId):
        auth.delete_user(userId)
        Users.objects(userId=userId).delete()
