from celery.utils.log import get_task_logger
from celery import shared_task

logger = get_task_logger(__name__)

@shared_task
def celery_debug(text):
    logger.info(f'Test: {text}')


@shared_task
def celery_beat_debug():
    logger.info('This is a test message.')
    celery_debug.delay("test text")


