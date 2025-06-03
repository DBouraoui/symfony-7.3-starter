.PHONY: down up build prod

up:
	docker compose up -d --wait

down:
	docker compose down

build:
	docker compose build --no-cache

prod:
	docker compose -f compose.prod.yaml build --no-cache
	docker compose -f compose.prod.yaml up -d --wait
