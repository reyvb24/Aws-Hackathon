import bcrypt
from flask import jsonify

from merchants.service import MerchantService
from server_framework.controller_layer import ControllerLayer


def hash_password(password):
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(password, salt)


class MerchantController(ControllerLayer):
    def __init__(self, context):
        super().__init__(context)
        self._log = self.context.logger
        self.merchant_service = MerchantService(context)

    def get(self):
        merchants = self.merchant_service.get_all()
        return jsonify(merchants)

