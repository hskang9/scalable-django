FROM python:3.7-alpine
MAINTAINER Hyungsuk Kang

ADD . /web
WORKDIR /web
RUN apk update
RUN apk add postgresql-dev gcc python3-dev musl-dev
RUN pip install psycopg2-binary
RUN pip install -r requirements.txt
RUN pip install gunicorn
RUN /usr/local/bin/gunicorn docker_django.wsgi:application -w 2 -b :8000