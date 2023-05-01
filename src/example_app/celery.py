import os

from celery import Celery
from datetime import timedelta
from django.apps import apps
# Set the default Django settings module for the 'celery' program.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'django_template.settings')

app = Celery('example_app')

# Using a string here means the worker doesn't have to serialize
# the configuration object to child processes.
# - namespace='CELERY' means all celery-related configuration keys
#   should have a `CELERY_` prefix.
app.config_from_object('django.conf:settings', namespace='CELERY')

app.conf.beat_schedule = {
    'celery_beat_debug_task': {
        'task': 'example_app.tasks.celery_beat_debug',
        'schedule': timedelta(seconds=5),
    },
}
app.autodiscover_tasks(['example_app'])
