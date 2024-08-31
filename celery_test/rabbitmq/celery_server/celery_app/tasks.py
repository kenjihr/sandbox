import os
import time
from celery import Celery

celery = Celery(__name__)
#celery.conf.broker_url = 'redis://redis_server:6379'
celery.conf.broker_url = 'amqp://guest:guest@rabbitmq_server:5672'
celery.conf.result_backend = 'redis://redis_server:6379'


@celery.task(name='tasks.calc_bmi')
def calc_bmi(weight: float, height: float) -> float:
    time.sleep(60*5)
    bmi = weight / height**2
    return bmi


