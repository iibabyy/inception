all:
	docker compose -f srcs/docker-compose.yml up

stop:
	docker compose -f srcs/docker-compose.yml stop

down:
	docker compose -f srcs/docker-compose.yml down

start:
	docker compose -f srcs/docker-compose.yml start

re: down all