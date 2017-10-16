FROM python:3.6-alpine3.6

RUN apk update
RUN apk add --no-cache --virtual .build-deps \
    gcc libc-dev openblas-dev


COPY analytics /src/analytics

WORKDIR /src/analytics
RUN pip install -r requirements.txt

WORKDIR /src/
CMD python analytics
