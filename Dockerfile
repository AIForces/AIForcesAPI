FROM python:3.7-alpine as base
# Common deps
RUN apk --no-cache add \
    bash \
    openssl \
    postgresql-dev

 # # # # # #
 # Builder #
 # # # # # #

FROM base as builder

ENV PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100 \
  POETRY_VERSION=1.0.2

# System deps:
RUN apk --no-cache add \
    build-base \
#    curl \
    gcc \
#    gettext \
#    git \
    libffi-dev \
    linux-headers \
    openssl-dev \
    musl-dev 

# Use pip to ensure a consistent poetry version
RUN pip install poetry==${POETRY_VERSION}
# Disable virtualenvs - docker is isolated enough
RUN poetry config virtualenvs.create false

# Copy the lock files first to cache dependencies
WORKDIR /install
COPY poetry.lock pyproject.toml /install/
RUN poetry install --no-interaction --no-ansi $(test "$DJANGO_ENV" == production && echo "--no-dev")
# TODO(?): Separate wheel build in order not to recompile a whole lot of binarieseach time


 # # # # # #
 #   App   #
 # # # # # #


FROM base as app
LABEL version="0.1"
LABEL maintainer="ddddanil5555@gmail.com"

# Set the environment - development or production
ARG DJANGO_ENV

ENV YOUR_ENV=${DJANGO_ENV} \
  PYTHONIOENCODING=UTF-8 \
  PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random

# Copy prebuilt libs
COPY --from=builder /usr/local /usr/local

WORKDIR /app

# Copy source code
COPY /webapi /app
