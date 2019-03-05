
FROM python:3.4

RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/

RUN apt-get update \
        && apt-get install -y --no-install-recommends libglib2.0-0\
        && apt-get update 

EXPOSE 8000 2222
CMD python manage.py runserver 0.0.0.0:8000
