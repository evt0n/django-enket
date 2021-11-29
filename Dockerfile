FROM python:3.8

RUN apt-get update\
# && apt-get install -y --no-install-recommends \
# postgresql-client \
    && rm -rf /var/lib/apt/lists/* \
    && python -m pip install --upgrade pip

COPY requirements.txt ./
RUN pip install -r requirements.txt
RUN django-admin startproject enket
WORKDIR /enket
RUN django-admin startapp polls
VOLUME /enket

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
