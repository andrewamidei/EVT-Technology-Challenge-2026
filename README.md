# EVT-Technology-Challenge-2026

## Prerequisite
This project uses docker so you must have docker installed on any system you choose to run this service on.

## One command run
Navigate to the project directory and run the script `run.sh`
```
./run.sh
```

On the same device navigate to `localhost` in your web browser to see the website with a self signed certificate.
## For development

### Environment setup
Pull the repository files and within the repository follow the steps below.

Create the `certs` directory.
```
certs
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

## Why these tools?
Fundamentally, I built this on Docker. Personally, I have used Docker for over four years, and I have found that tools such as a web server are handled well in this environment. Additionally, the benefits of having the ability to move cross-platform works very well for my development/deployment environments. The tool that runs the website is Nginx, and I chose to use this because of its wide adoption, speed, and utility. I have never used Nginx as a web server before, and I can say that I would consider using it again.