FROM python:3.7


# Install debian requirements
RUN apt-get update \
        && apt-get install -y --no-install-recommends libglib2.0-0\
        && apt-get update 
        
# Install python requirements
WORKDIR /mnt/CrackDetection
ADD requirements.txt .
RUN pip install -r requirements.txt

#expose ports
EXPOSE 80 443

ENV SHARE_DIR=/mnt/share
CMD python manage.py runserver 0.0.0.0:80
