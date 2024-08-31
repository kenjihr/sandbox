sleep 5

celery -A tasks worker --loglevel=INFO

wait