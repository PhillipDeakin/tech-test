
# Version 1.1 - Updated 14/01/23 
# Pull the latest nginx:alpine image
FROM nginx:alpine

# Authors/Owners of this Dockerfile
LABEL Authors="Phillip Deakin"

# Copy HTML, Assets and Config to Nginx
COPY code/index.html /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
COPY nginx.conf /etc/nginx.conf

# Expose Nginx Port
EXPOSE 8080 

# Start NginxService 
CMD ["nginx", "-g", "daemon off;"]