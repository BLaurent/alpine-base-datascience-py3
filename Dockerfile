FROM python:3.7.0a1-alpine3.6

RUN apk update
RUN apk add --no-cache --virtual .build-deps \
    gcc libc-dev openblas-dev lapack-dev


COPY analytics /src/analytics

WORKDIR /src/analytics

RUN pip install -r requirements.txt

WORKDIR /src/
CMD python analytics
