FROM nginx:1.21.4-alpine

# Remove the default configuration file
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom configuration file to the container
COPY docker/nginx/local/nginx.conf /etc/nginx/conf.d/

# Expose port 80 (HTTP) and 443 (HTTPS)
EXPOSE 80
EXPOSE 443


# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
