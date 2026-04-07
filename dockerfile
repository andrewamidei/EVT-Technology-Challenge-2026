FROM nginx:stable-alpine

WORKDIR /etc/nginx

COPY localhost.cnf /etc/nginx/

# storing key unencrypted in container. Don't use in real prod environment.
RUN apk add --no-cache openssl && \
    openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout ../ssl/localhost.key \
    -out ../ssl/localhost.crt \
    -config localhost.cnf \
    -subj "/C=US/CN=localhost"

# Remove default nginx configuration and add our custom configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d/

COPY /html /var/www/html
