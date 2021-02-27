import logging

from sendgrid import SendGridAPIClient


class ServiceContext(object):
    def __init__(self, config):
        self.config = config
        # Todo: setup logger and log all through this logger
        self.logger = self._setup_logger()
        # self.storage = self.get_storage(config)

    def _setup_logger(self):
        logging.basicConfig(
            format='%(asctime)s %(levelname)s %(pathname)s %(funcName)s %(lineno)d: %(message)s')
        logger = logging.getLogger('yass')
        logger.setLevel(logging.DEBUG)
        return logger

    # def get_storage(self):
    #     db = MongoEngine()
