class Config(object):
    def __init__(self):
        MONGODB_USERNAME = "superuser"
        MONGODB_PASSWORD = "goaldigger"
        MONGODB_URL = "cluster0.0bepx.mongodb.net/goaldigger"

        self.SECRET_KEY = "goaldigger"
        self.DEBUG = False
        self.TESTING = False
        self.MONGODB_SETTINGS = {
            "host": "mongodb+srv://{}:{}@{}".format(MONGODB_USERNAME, MONGODB_PASSWORD, MONGODB_URL)
        }
        self.PORT = 8888
