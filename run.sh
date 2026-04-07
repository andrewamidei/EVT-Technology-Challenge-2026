docker build -t local_nginx .

docker run -p 443:443 --name webserver -d local_nginx
