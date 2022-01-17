FROM docker.io/python:3.8.12-slim-buster

ADD requirements.txt /app/requirements.txt

RUN apt-get update -y

RUN set -ex \
    && python -m venv /env \
    && /env/bin/pip install --upgrade pip
RUN /env/bin/pip install --upgrade pip setuptools wheel
RUN /env/bin/pip3 install --no-cache-dir -r /app/requirements.txt

ADD . /app
WORKDIR /app

RUN mkdir -p /var/log/gunicorn/

ENV VIRTUAL_ENV /env

ENV PATH /env/bin:$PATH