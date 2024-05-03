FROM python:3.9-alpine3.13
LABEL maintainer="isaquillo78"


# This is recommended when we are runing Python in a Docker container. 
# the output from Python will be printed directly to the consoles in order
# to prevent any delays of messages
ENV PYTHONBUFFERED 1 

# This instruction is for copy the local requirements.txt file to
# the Docker image
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt

# Copy the app directory
COPY ./app /app


WORKDIR /app

# The port where we can connect to the Docker Image
EXPOSE 8000

ARG DEV=false
RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requirements.txt && \
    if [ $DEV = "true" ]; \
        then /py/bin/pip install -r /tmp/requirements.dev.txt ; \
    fi && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user
