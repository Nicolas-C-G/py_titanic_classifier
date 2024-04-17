echo "Start Server"
. ./lab/bin/activate
cd /home/ubuntu/py_titanic_classifier && gunicorn -c gunicorn_config.py titanic.wsgi