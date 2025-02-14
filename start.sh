#!/bin/sh
set -e


envsubst '\$PORT' < /etc/nginx/nginx.conf > /etc/nginx/nginx.conf.tmp
mv /etc/nginx/nginx.conf.tmp /etc/nginx/nginx.conf


nginx -g "daemon off;" &


uvicorn main:app --host 0.0.0.0 --port 8000


wait
