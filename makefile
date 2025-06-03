.PHONY: down up build prod

up:
	docker compose up -d --wait

down:
	docker compose down

build:
	docker compose build --no-cache

prod:
	docker compose -f compose.prod.yaml build
	docker compose -f compose.prod.yaml up -d --wait
	docker compose -f compose.prod.yaml exec app composer install

deploy:
	ansible-playbook -i ansible/inventory.yaml ansible/deploy.yaml
