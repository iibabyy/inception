all: up

up:
	@mkdir -p /home/ibaby/data/wordpress
	@mkdir -p /home/ibaby/data/mysql
	@docker compose -f srcs/docker-compose.yml up --build

down:
	@docker compose -f srcs/docker-compose.yml down

d: network_up
	@docker compose -f srcs/docker-compose.yml up -d --build

stop:
	@docker compose -f srcs/docker-compose.yml stop

start:
	@docker compose -f srcs/docker-compose.yml start

re: down all
red: down d

network_up:
	docker network create wpnetwork

network_down:
	docker network rm wpnetwork

clean:
	docker system prune --all
