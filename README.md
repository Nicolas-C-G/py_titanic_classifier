This repository contains a django web app integrated with a random forest model.
If the model does not run on the machine, try to create a new one with the code in py-randomforest-sample repository

Running py_titanic_classifier on local pc
- Install python3 https://www.python.org/downloads/
- Install git
- Install pip
- Install venv https://docs.python.org/3/library/venv.html
- Create a folder where you are going to excecute git clone of this repository.
- Create a virtual enviroment with python venv https://docs.python.org/3/library/venv.html
- Activate the virtual enviroment.
- Use git clone to copy this project.<br>
&nbsp;--Project-folder<br>
&nbsp;&nbsp;|<br>
&nbsp;&nbsp;|--Virtual venv folder<br>
&nbsp;&nbsp;|--py_titanic_classifier<br>
- Go into py_titanic_classifier and install all the dependencies by using "pip3 install -r requirements.txt".
- Open py_titanic_classifier/titanic then uncomment the line 32 and comment line 33 in settings.py (ALLOWED_HOST).
- Return to py_titanic_classifier and execute "pyhton manage.py runserver"


Running py_titanic_classifier on AWS EC2 instance
- Create an EC2 ubuntu:22.04 LTS instance.
- Go to security groups and add a new inbound rule, which has to be custom tcp, port range in 8000 and source Anywhere.
- Open instance terminal and install docker https://docs.docker.com/engine/install/ubuntu/
- Install pip "sudo apt install python3-pip"
- Install docker-compose "sudo apt  install docker-compose"
- Upload Dockerfile (if you want to create your own image) and docker-compose.yml to the same directory.
- To run the server and the django app, execute "sudo docker-compose up -d"
- Open a browser and paste the public instance ip plus port 8000 then you will see the webpage.
