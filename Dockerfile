FROM nginx:latest

# Copy the HTML content for the first container into the image
COPY square /usr/share/nginx/html/square

# Copy the HTML content for the second container into the image
COPY cube /usr/share/nginx/html/cube

# Copy the configuration files for the web server
COPY square.conf /etc/nginx/conf.d/square.conf
COPY cube.conf /etc/nginx/conf.d/cube.conf

# Expose the ports that the web servers should listen on
EXPOSE 8080
EXPOSE 8081
