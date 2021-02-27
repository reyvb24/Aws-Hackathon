from typing import List

from merchants.controller import MerchantController
from server_framework.endpoints_binding import EndpointBinding
from users.controller import (UserController, UserLogin)


def get_endpoints() -> List[EndpointBinding]:
    endpoints = []

    endpoints.append(EndpointBinding(url_pattern="/login",
                                     methods=["POST"],
                                     controller=UserLogin))

    endpoints.append(EndpointBinding(url_pattern="/user",
                                     methods=["GET", "POST", "PATCH", "DELETE"],
                                     controller=UserController))

    endpoints.append(EndpointBinding(url_pattern="/merchants",
                                     methods=["GET"],
                                     controller=MerchantController))

    return endpoints
