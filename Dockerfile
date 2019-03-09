FROM python:3.7

ARG REPO_PATH=/mnt/CrackDetection
ENV FILESHARE_PATH=/mnt/share

# Install debian requirements
RUN apt-get update \
        && apt-get install -y --no-install-recommends libglib2.0-0\
        && apt-get update 
        
# Install python requirements
WORKDIR $REPO_PATH
ADD requirements.txt .
RUN pip install -r requirements.txt

#expose ports
EXPOSE 80 443

CMD python manage.py runserver 0.0.0.0:80
