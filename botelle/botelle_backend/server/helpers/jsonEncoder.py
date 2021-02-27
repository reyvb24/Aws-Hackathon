import json
from datetime import datetime

from bson import ObjectId


class JSONEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, ObjectId) or isinstance(o, datetime):
            return str(o)
        return json.JSONEncoder.default(self, o)


def toJson(object):
    res = JSONEncoder().encode(object.to_mongo())
    return json.loads(res)
