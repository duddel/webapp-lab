#!/bin/sh

# start backend API server  
cd backend
python3 -m swagger_server &

# start httpd (frontend server)
/usr/sbin/httpd -D FOREGROUND
