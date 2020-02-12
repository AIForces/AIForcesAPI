#!/bin/bash
case "$1" in
  start )
    docker-compose up -d --build
    ;;
  migrate )
    docker-compose exec django.api python manage.py migrate --noinput
    ;;
  stop )
    docker-compose down -v
esac
