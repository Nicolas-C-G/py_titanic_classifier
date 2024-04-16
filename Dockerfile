FROM ubuntu:24.04
WORKDIR /home/ubuntu

RUN apt-get update
RUN apt-get install git -y
RUN apt install python3 -y
RUN apt install python3-pip -y
RUN apt install vim -y
RUN apt-get -y install systemctl
RUN apt install curl -y
RUN apt install python3.12-venv -y

EXPOSE 8000
////////////////////////////////////////
curl http://checkip.amazonaws.com //get ip

RUN cd /home
RUN git clone https://github.com/Nicolas-C-G/py-randomforest-sample.git
RUN cd /home/py-randomforest-sample && pip3 install -r requirements.txt
RUN python3 main.py
RUN cd /home

RUN git clone https://github.com/Nicolas-C-G/py_titanic_classifier.git
RUN cd py_titanic_classifier
RUN rm titanic_model.sav
RUN cd /home/py-randomforest-sample
RUN cp titanic_model.sav /home/py_titanic_classifier/
RUN cd /home/py_titanic_classifier
RUN pip3 install -r requirements.txt

RUN cd /home/py_titanic_classifier
RUN python3 manage.py runserver 0.0.0.0:8000
///////////////////////////////////////////////
EXPOSE 8000

Installer

#!/bin/sh
#

echo "Titanic installer"
cd /home/ubuntu && rm -rf lab py*

python3 -m venv lab
chmod +x lab/bin/activate
. ./lab/bin/activate

cd /home/ubuntu && git clone https://github.com/Nicolas-C-G/py-randomforest-sample.git
cd /home/ubuntu/py-randomforest-sample && pip3 install -r requirements.txt
python3 main.py

cd /home/ubuntu && git clone https://github.com/Nicolas-C-G/py_titanic_classifier.git
cd py_titanic_classifier && rm titanic_model.sav
cd /home/ubuntu/py-randomforest-sample
cp titanic_model.sav /home/ubuntu/py_titanic_classifier/
cd /home/ubuntu/py_titanic_classifier && pip3 install -r requirements.txt

pip3 install gunicorn

IP=$(curl http://checkip.amazonaws.com)
echo "ALLOWED_HOSTS=$IP,localhost" > .env

cd /home/ubuntu/py_titanic_classifier && gunicorn --bind 0.0.0.0:8000 titanic.wsgi
echo "End configurations"


sudo docker run -p 8000:8000 -ti dj:v4 /bin/bash

[Unit]
Description=gunicorn daemon
After=network.target
[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/py_titanic_classifier
ExecStart=/home/ubuntu/.local/bin/gunicorn --access-logfile - --workers 3 --bind unix:/home/ubuntu/py_titanic_classifier/titanic.sock titanic.wsgi:application
[Install]
WantedBy=multi-user.target 

[Unit]
Description=Gunicorn daemon for my Django project
After=network.target

[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/py_titanic_classifier
ExecStart=/home/ubuntu/lab/bin/activate \
          --workers 3 \
          --bind 0.0.0.0:8000 \
          titanic.wsgi:application

[Install]
WantedBy=multi-user.target