# EVT-Technology-Challenge-2026

## What is this?
This repository contains a containerized nginx web server with a Dockerfile and 
Docker Compose. Alongside this is a simple configuration for a self-signed certificate
and some simple scripts to help run and clean up the environment quickly. Finally, 
the HTML itself hosted on the site is an introduction of myself and a showcase of some 
of my recent projects.

## Why these tools?
Fundamentally, I built this on Docker. I have used Docker for over four years, 
and I've found that tools such as a web server are handled well in this environment. 
Additionally, the benefits of having the ability to move cross-platform work very 
well for my development/deployment environments. The tool that runs the website is 
Nginx, which I chose to use due to its wide adoption, speed, and utility. I 
have never used Nginx as a web server before, and I can say that I would consider 
using it again.

## Prerequisite
This project uses docker so you must have docker installed on any system you choose to run this service on.

## One command run
Navigate to the project directory and run the script `run.sh`.
```
./run.sh
```
This script builds the image and names it `local_nginx` and starts a 
container named `webserver`.

### Cleaning before rebuilding image
Navigate to the project directory and run the script `clean.sh`.
```
./clean.sh
```
This script stops the `webserver` container, removes it, and deletes
the `local_nginx` image.

On the same device navigate to `localhost` in your web browser to see the website with a self signed certificate.
## For development

### Environment setup
Pull the repository files and within the repository follow the steps below.

Create the `certs` directory.
```
mkdir certs
```

Generate OpenSSL certificates for the project.
```
openssl req -x509 -nodes -days 365 \
 -newkey rsa:2048 \
 -keyout certs/localhost.key \
 -out certs/localhost.crt \
 -config nginx/localhost.cnf
```

### Running Webserver
Boot up container.
```
docker compose up -d
```  

On the same device navigate to `localhost` in your web browser to see the website with a self signed certificate.

Check compose logs.
```
docker compose logs -f
```
