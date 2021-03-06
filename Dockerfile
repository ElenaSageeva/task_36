FROM ubuntu:latest  
RUN apt-get update  
RUN apt-get install -y nginx 
RUN rm /etc/nginx/sites-enabled/default
COPY ./hosts/application.local.conf /etc/nginx/sites-available/application.local.conf
RUN ln -s /etc/nginx/sites-available/application.local.conf /etc/nginx/sites-enabled/application.local.conf
WORKDIR /data  
VOLUME /data  
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
