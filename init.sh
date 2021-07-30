#!/bin/bash
echo "Started !"

ls -l

cd /opt/SSD/ssd

export SERVER_CONFIG="/opt/SSD/config/server.cfg"
export AGENT_CONFIG="/opt/SSD/config/agent.cfg"

git pull
python3 manage.py makemigrations backend
python3 manage.py migrate
python3 manage.py runserver 0.0.0.0:8000
