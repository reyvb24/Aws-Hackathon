import bcrypt

from context import ServiceContext
from merchants.model import Merchants
from server_framework.service_layer import ServiceLayer


# Helper Methods
def hash_password(password):
    salt = bcrypt.gensalt()
    return bcrypt.hashpw(password, salt)


class MerchantService(ServiceLayer):
    def __init__(self, context: ServiceContext):
        super().__init__(context)

    def get_all(self):
        merchant = Merchants.objects()
        return merchant
