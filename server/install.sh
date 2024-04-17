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
cd /home/ubuntu/py_titanic_classifier && rm titanic_model.sav
cd /home/ubuntu/py-randomforest-sample
cp titanic_model.sav /home/ubuntu/py_titanic_classifier/
cd /home/ubuntu/py_titanic_classifier && pip3 install -r requirements.txt

pip3 install gunicorn

IP=$(curl http://checkip.amazonaws.com)
echo "ALLOWED_HOSTS=$IP,localhost" > .env

cp /home/ubuntu/py_titanic_classifier/server/server.sh /home/ubuntu/

chmod +x /home/ubuntu/server.sh

echo "End configurations"

#background process
echo "Server"
cd /home/ubuntu && ./server.sh