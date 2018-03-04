!#/bin/bash

sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install vim
sudo apt-get -y install python3 python3-pip python-dev
sudo -H pip3 install jupyterlab

mkdir ~/.jupyter
echo "c.NotebookApp.allow_origin = '*'
c.NotebookApp.ip = '0.0.0.0'" | sudo tee /home/ubuntu/.jupyter/jupyter_notebook_config.py