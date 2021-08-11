FROM python:3.6-alpine

# prepare working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# copy backend and the start script
COPY ./backend backend/
COPY ./run_servers.sh ./
RUN chmod +x ./run_servers.sh

# install requirements and packages
RUN pip3 install --no-cache-dir -r backend/requirements.txt
RUN apk update
RUN apk add apache2

# copy frontend to apache2 (httpd) default DocumentRoot,
# overwriting apache2 default index.html
COPY ./frontend /var/www/localhost/htdocs

# expose port 80 (default http, frontend) and port 8080 (backend)
EXPOSE 80
EXPOSE 8080

# start frontend and backend servers
CMD ./run_servers.sh
