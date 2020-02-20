FROM nginx:latest
COPY launch /
COPY nginx.conf /etc/nginx/nginx.conf
#COPY nginx_ssl.conf /etc/nginx/nginx.conf
#COPY sslkeys/host.key /etc/nginx/certs/
#COPY sslkeys/host.pem /etc/nginx/certs/
WORKDIR /NetApp/ConfigAdvisor
ENTRYPOINT ["/launch"]
