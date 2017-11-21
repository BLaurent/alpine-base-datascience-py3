FROM python:3.6-alpine3.6


RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk --update add --no-cache --virtual .build-deps  \
    lapack-dev \
    gcc \
    gfortran \
    musl-dev \
    g++

COPY analytics/Pipfile /src/analytics/
COPY analytics/Pipfile.lock /src/analytics/

WORKDIR /src/analytics
RUN pip install pipenv
RUN pipenv install --deploy --system

COPY analytics /src/analytics

WORKDIR /src/
RUN apk del .build-deps

COPY analytics /src/

CMD python analytics
