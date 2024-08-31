FROM python:3.11

RUN apt-get update && apt-get -y upgrade && apt-get install -y python3 python3-pip
COPY ./requirements.txt /tmp/
RUN python3 -mpip install -r /tmp/requirements.txt

WORKDIR /opt/celery_server/celery_app

CMD ["sh", "/opt/celery_server/run.sh"]
