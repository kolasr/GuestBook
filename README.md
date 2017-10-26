# Guestbook Application
## Description

A simple Go web application with a redis backend

The app will be running at http://localhost:3000, and the results will be at http://localhost:3000.


## Prereq
Download Docker. If you are on Mac or Windows, Docker Compose will be automatically installed. On Linux, make sure you have the latest version of Compose.

After Docker installation , Make sure you Initialize a swarm using below command

* docker swarm init

## Deploy the Application

    docker deploy -c .\docker-compose.yaml guestbook_stack