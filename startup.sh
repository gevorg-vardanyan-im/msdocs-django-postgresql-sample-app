# startup.sh is used by infra/resources.bicep to automate database migrations and isn't used by the sample application
python manage.py migrate
python manage.py collectstatic --noinput

gunicorn --workers 2 --threads 4 --timeout 60 azureproject.wsgi
