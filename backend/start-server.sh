#!/usr/bin/env bash
# start-server.sh

echo "Hello from Project Agora MP"

if [ -n "$DJANGO_SUPERUSER_USERNAME" ] && [ -n "$DJANGO_SUPERUSER_PASSWORD" ] ; then
    (echo "creating superuser ${DJANGO_SUPERUSER_USERNAME}" && python djangobaseproject/manage.py createsuperuser --no-input --noinput --email 'blank@email.com' )
fi



#python manage.py migrate && ./populate_db.sh && python manage.py loaddata fixtures/sample-providers.json && python manage.py loaddata fixtures/sample-users.json && python manage.py loaddata fixtures/sample-contactInformations.yaml && python manage.py loaddata fixtures/sample-resources.yaml

python manage.py collectstatic --no-input 
gunicorn agora.wsgi --bind 0.0.0.0:8010 --workers 3 --timeout 600 & nginx -g "daemon off;"