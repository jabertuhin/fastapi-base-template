# Image for package building
FROM python:3.10.4-slim-buster AS builder

ARG POETRY_VERSION="1.1.13" \
    WORK_APP_DIR="/app"

ENV PIP_DISABLE_PIP_VERSION_CHECK=on \
    POETRY_NO_INTERACTION=1 \
    POETRY_HOME="/opt/poetry" \
    POETRY_VERSION=$POETRY_VERSION
ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl \
    && rm -rf /var/lib/apt/lists/*

WORKDIR $WORK_APP_DIR

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

COPY pyproject.toml poetry.lock ./

RUN poetry export -f requirements.txt --without-hashes --output requirements.txt \
    && pip wheel --no-cache-dir --wheel-dir $WORK_APP_DIR/wheels -r requirements.txt


# Image for deployment
FROM python:3.10.4-slim-buster

ARG APP_PORT=8080 \
    WORK_APP_DIR="/app"

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=on

RUN apt-get update \
    && apt-get install --no-install-recommends -y build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR $WORK_APP_DIR

COPY --from=builder $WORK_APP_DIR/wheels /wheels

RUN pip install --no-cache-dir  /wheels/*

COPY . ./

EXPOSE $APP_PORT

CMD [ "make", "server" ]
