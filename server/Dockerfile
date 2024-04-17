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

RUN cd /home/ubuntu && git clone https://github.com/Nicolas-C-G/py_titanic_classifier.git && \
    chmod +rwx /home/ubuntu/py_titanic_classifier/server/install.sh
RUN cp /home/ubuntu/py_titanic_classifier/server/install.sh /home/ubuntu/
RUN cd /home/ubuntu && rm -rf py_titanic_classifier
CMD cd /home/ubuntu && ./install.sh

EXPOSE 8000
