# Tutorial: https://makefiletutorial.com/#top
# About PHONY: https://stackoverflow.com/a/2145605

.PHONY: server
server:
	gunicorn app.main:app -c gunicorn_config.py

.PHONY: dev_setup
dev_setup:
	poetry install

.PHONY: pre_commit_setup
pre_commit_setup:
	pre-commit install --hook-type pre-commit --hook-type pre-push

.PHONY: server_setup
server_setup:
	poetry install --no-dev

.PHONY: test
test:
	pytest --cov-report term:skip-covered --cov=app tests/

.PHONY: html_test_coverage
html_test_coverage:
	pytest --cov-report html --cov-report term:skip-covered --cov=app tests/

.PHONY: xml_test_coverage
xml_test_coverage:
	pytest --cov-report xml --cov-report term:skip-covered --cov=app tests/
