FROM nginx:stable-alpine

WORKDIR /etc/nginx

# Copy localhost.cnf into correct directory
COPY nginx/localhost.cnf /etc/nginx/

# storing key unencrypted in container. Don't use in real prod environment.
RUN apk add --no-cache openssl && \
    openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 \
    -keyout ../ssl/localhost.key \
    -out ../ssl/localhost.crt \
    -config localhost.cnf \
    -subj "/C=US/CN=localhost"

# Remove default nginx configuration and add custom configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY nginx/nginx.conf /etc/nginx/conf.d/

# Copy html files into correct directory
COPY /html /var/www/html

HEALTHCHECK --start-period=30s CMD nginx -t \
&& curl --fail --cacert ../ssl/localhost.crt https://localhost \
|| exit 1
