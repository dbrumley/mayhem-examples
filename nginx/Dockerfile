FROM nginx:1.16-alpine
COPY nginx.conf .
CMD ["/usr/sbin/nginx", "-p", ".", "-c", "nginx.conf"]
EXPOSE 8080
