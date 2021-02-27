from typing import List

from server_framework.controller_layer import ControllerLayer


class EndpointBinding(object):
    def __init__(self, url_pattern, methods, controller):
        self.url_pattern: str = url_pattern
        self.methods: List[str] = methods
        self.controller: ControllerLayer = controller
