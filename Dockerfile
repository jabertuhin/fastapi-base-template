# Image for package building
FROM python:3.10.4-slim-buster AS builder

ARG WORK_APP_DIR="/app"

ENV PIP_DISABLE_PIP_VERSION_CHECK=on \
    UV_SYSTEM_PYTHON=1

RUN apt-get update \
    && apt-get install --no-install-recommends -y curl \
    && rm -rf /var/lib/apt/lists/*

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR $WORK_APP_DIR

COPY pyproject.toml uv.lock ./

RUN uv export --no-hashes --output-file requirements.txt \
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
