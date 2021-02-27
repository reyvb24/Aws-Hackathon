from flask_jwt_extended import (create_access_token, get_jwt_identity,
                                jwt_refresh_token_required)

from server_framework.controller_layer import ControllerLayer


class Auth(ControllerLayer):
    @jwt_refresh_token_required
    def post(self):
        current_user = get_jwt_identity()
        new_token = create_access_token(identity=current_user, fresh=False)
        return {"access_token": new_token}
