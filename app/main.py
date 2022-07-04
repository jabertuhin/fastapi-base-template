from fastapi import FastAPI

from app.route import health

# TODO: Read api_version and title from config file.
api_version = "v0.1"
title = "DVD Rental"
app = FastAPI(title=title, version=api_version)


# including router in the app
app.include_router(health.router)
