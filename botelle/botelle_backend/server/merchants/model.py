from mongoengine import (Document,
                         StringField)


class Merchants(Document):
    name = StringField(required=True)
    location = StringField(required=True)
    logo = StringField(required=True)
    merchantID = StringField(required=True)