FROM python:3.11.2-slim

EXPOSE 8000
WORKDIR /app


RUN apt-get update && \
    apt-get install -y --no-install-recommends netcat && \
    apt-get -y install libpq-dev gcc && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY requirements.txt ./
RUN pip install -r requirements.txt

ADD . /app

ENTRYPOINT ./entrypoint.sh