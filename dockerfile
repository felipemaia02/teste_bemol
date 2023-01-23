# pull the official docker image
FROM python:3.8.10-slim

WORKDIR /myra-ink-backend
# set env variables

RUN pip install "poetry"


# install dependencies
COPY poetry.lock .
COPY pyproject.toml .
RUN poetry export -f requirements.txt --output requirements.txt --without-hashes
RUN pip install -r requirements.txt
RUN pip list
RUN pip install pytest
RUN pip uninstall "poetry" -y

# copy project
COPY . .
