# Use the alpine Linux image
FROM alpine

# Install necessary packages (NGINX in this case)
RUN apk update && apk add --no-cache nginx git

# Clone the repository
RUN git clone https://github.com/notsogaurab/test-site /tmp/test-site

# Copy the site folder to NGINX document root folder
RUN cp -r /tmp/test-site/site /usr/share/nginx/html

# Remove the default NGINX configuration file
RUN rm /etc/nginx/http.d/default.conf

# Copy the custom NGINX configuration file
COPY nginx-docker.conf /etc/nginx/http.d/

# Expose port 9000 in the host and link it with the default NGINX port
EXPOSE 8000

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]