FROM python:3.12.2-slim-bookworm

# set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install linux dependencies
RUN apt-get update -y && apt-get upgrade -y \
  && apt-get install -y \
    bash \
    git \
    curl \
    iputils-ping \
    postgresql-client \
    shared-mime-info \
    sudo \
    tzdata \
    vim \
    gettext \
    gcc g++ \
    gfortran musl-dev

# Non root user
ARG DOCKER_UID=1000
ARG DOCKER_GID=1000
ARG USER=django
ENV DOCKER_UID $DOCKER_UID
ENV DOCKER_GID $DOCKER_GID
ENV USER $USER

# set work directory
WORKDIR /project/django_project

RUN addgroup --gid $DOCKER_GID $USER \
  && adduser --disabled-password --uid $DOCKER_UID --ingroup $USER $USER \
  && chown $USER:$USER /project
USER $USER
ENV PATH "/home/$USER/.local/bin:$PATH"

# install poetry to manage python dependencies
RUN pip install --upgrade pip \
  && pip install poetry

# install python dependencies
COPY --chown=$USER:$USER ./django_project/pyproject.toml /project/django_project/
COPY --chown=$USER:$USER ./django_project/poetry.lock /project/django_project
RUN poetry install

# copy project code
COPY --chown=$USER:$USER ./bin/entrypoint-django.development.sh /project/bin
COPY --chown=$USER:$USER ./bin/entrypoint-celeryworker.sh /project/bin
COPY --chown=$USER:$USER ./bin/entrypoint-celerybeat.sh /project/bin

# run at port 8000
EXPOSE 8000

CMD ["poetry", "run", "python", "/project/core/manage.py", "runserver", "0.0.0.0:8000"]
