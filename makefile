.PHONY: down up build prod deploy-ansible

up:
	docker compose up -d --wait

down:
	docker compose down

build:
	docker compose build --no-cache

prod:
	sudo docker compose down
	sudo docker compose down --volumes --remove-orphans
	sudo docker network prune -f
	docker compose -f compose.prod.yaml build
	docker compose -f compose.prod.yaml up -d --wait
	docker compose -f compose.prod.yaml exec app composer install

deploy-ansible:
	ansible-playbook -i ansible/inventory.yaml ansible/deploy.yaml
