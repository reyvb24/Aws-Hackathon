from context import ServiceContext


class ServiceLayer:
    # Todo: create storage layer
    # A service layer can only talk to 1 DB schema
    storage = None

    def __init__(self, context: ServiceContext):
        self.context = context
