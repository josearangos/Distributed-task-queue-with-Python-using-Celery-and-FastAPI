FROM python:3.8.3-buster

ENV PYTHONFAULTHANDLER=1 \
  PYTHONUNBUFFERED=1 \
  PYTHONHASHSEED=random \
  PIP_NO_CACHE_DIR=off \
  PIP_DISABLE_PIP_VERSION_CHECK=on \
  PIP_DEFAULT_TIMEOUT=100


RUN pip install virtualenv

WORKDIR /code
RUN virtualenv distributed-task
COPY requierements.txt /code/requierements.txt
RUN pip install -r /code/requierements.txt
COPY app.py /code/app.py
COPY worker.py /code/worker.py