import json
from fastapi import FastAPI

from app.route import health, string_operations
from app import project_root_path


project_properties = json.loads(
    (project_root_path / "project_properties.json").read_text()
)


app = FastAPI(
    title=project_properties["project_title"], version=project_properties["api_version"]
)


# including router in the app
app.include_router(health.router)
app.include_router(string_operations.router)
