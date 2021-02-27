from flask.views import View

from context import ServiceContext
from server_framework.endpoints_binding import EndpointBinding


class DispatchingView(View):
    def __init__(self, binding, context):
        self.binding: EndpointBinding = binding
        self.context: ServiceContext = context

    def dispatch_request(self, *args, **kwargs):
        controller = self.binding.controller(context=self.context)
        self.binding.controller.context = self.context
        return controller.dispatch_request(*args, **kwargs)
