from flask_restful import Resource, reqparse

from context import ServiceContext


class ControllerLayer(Resource):
    def __init__(self, context: ServiceContext):
        self.context = context
        self.parser = reqparse.RequestParser()
        self.class_name = self.__name__()

    def __name__(self):
        return self.__class__.__name__
