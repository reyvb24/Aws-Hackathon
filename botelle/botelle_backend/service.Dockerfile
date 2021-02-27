FROM python:3.7

COPY server/ server/
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

WORKDIR server/

ENV PORT 8080

CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 main:app --preload --log-level debug