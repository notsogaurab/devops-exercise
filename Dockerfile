# Use the alpine Linux image
FROM alpine

# Install necessary packages (NGINX in this case)
RUN apk update && apk add --no-cache nginx git

# Clone the repository
RUN git clone https://github.com/notsogaurab/test-site /tmp/task

# Copy the site folder to NGINX document root folder
RUN cp -r /tmp/task/site /usr/share/nginx/html

RUN rm /etc/nginx/http.d/default.conf

COPY nginx-docker.conf /etc/nginx/http.d/

# Expose port 9000 in the host and link it with the default NGINX port
EXPOSE 9000

# Start NGINX server
# CMD ["nginx", "-g", "daemon off;"]

CMD ["nginx", "-g", "daemon off;"]