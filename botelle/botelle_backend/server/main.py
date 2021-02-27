import logging
import os

from server import Server

server = Server()
env_config = server.create_config()

app = server.create_app(config=env_config)
gunicorn_logger = logging.getLogger("gunicorn.error")
app.logger.handlers = gunicorn_logger.handlers
app.logger.setLevel(gunicorn_logger.level)
app.run(host="0.0.0.0", debug=True, port=8080)
