FROM python:3.9 as requirements-stage

WORKDIR /tmp

RUN pip install poetry

COPY ./pyproject.toml ./poetry.lock* /tmp/

RUN poetry export -f requirements.txt --output requirements.txt --without-hashes

FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

COPY --from=requirements-stage /tmp/requirements.txt /app/requirements.txt

# Install build essentials
RUN apt-get update && apt-get install curl build-essential libvips -y

RUN pip install watchdog argh PyYAML

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY ./app /app

