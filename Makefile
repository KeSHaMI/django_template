setup:
	sudo sh scripts/update_hosts.sh
	make local-build
	make local-start
	make django-init
	sh scripts/setup_completed_message.sh


test:
	make django-manage cmd="test -t ."

django-init:
	make django-manage cmd=collectstatic
	make django-manage cmd=makemigrations
	make django-manage cmd=migrate
	make django-manage cmd=createsuperuser

django-manage:
	docker exec -ti app python manage.py $(cmd)

local-build:
	DOCKER_DEFAULT_PLATFORM=linux/amd64 docker compose -f local.compose.yml build

local-start:
	docker compose -f local.compose.yml up -d

local-reboot:
	make local-build
	docker compose -f local.compose.yml down
	make local-start

celery-reboot:
	docker compose -f local.compose.yml restart celery
	docker compose -f local.compose.yml restart celery-beat
	docker compose -f local.compose.yml restart flower


prod-build:
	docker compose -f local.compose.yml -f prod.compose.yml build

prod-start:
	docker compose -f local.compose.yml -f prod.compose.yml up -d

prod-reboot:
	make prod-build
	docker compose -f local.compose.yml -f prod.compose.yml down
	make prod-start
