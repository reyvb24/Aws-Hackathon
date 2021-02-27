import datetime

from mongoengine import (BooleanField, DateTimeField, DecimalField, Document,
                         EmbeddedDocument, EmbeddedDocumentField, IntField, ListField,
                         StringField)

DEFAULT_PROFILE_PIC = "https://firebasestorage.googleapis.com/v0/b/" \
                      "yass-prod.appspot.com/o/DEFAULT_PROFILE_PIC.png?" \
                      "alt=media&token=8b9c51d5-236f-4d9b-b5e8-32a9c3e59fa5"


class Users(Document):
    fName = StringField(required=True)
    lName = StringField()
    email = StringField(required=True, unique=True)
    userId = StringField(required=True, unique=True)
    username = StringField(required=True, unique=True)
    password = StringField(required=True)
    profilePic = StringField(default=DEFAULT_PROFILE_PIC)
    created = DateTimeField(default=datetime.datetime.now)
