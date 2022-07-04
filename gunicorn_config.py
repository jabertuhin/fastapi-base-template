# source: https://github.com/benoitc/gunicorn/blob/master/examples/example_config.py
import os

port = os.getenv("PORT", 8080)
bind = f"0.0.0.0:{port}"
backlog = os.getenv("BACKLOG_NUM", 2048)


workers = os.getenv("WORKER_NUM", 2)
worker_class = "uvicorn.workers.UvicornWorker"


errorlog = "-"
loglevel = os.getenv("LOG_LEVEL", "INFO")
accesslog = "-"
