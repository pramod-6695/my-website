FROM nginx:latest
COPY index.html /usr/share/nginx/html/index.html
COPY index.html /usr/share/nginx/html/styles.css
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

