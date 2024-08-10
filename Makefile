all: up

up: build
	docker-compose -f ./inception/docker-compose.yml up -d
	docker-compose -f ./ELK-Stack/docker-compose.yml up -d
	docker-compose -f ./prom-garfana/docker-compose.yml up -d

down:
	docker-compose -f ./prom-garfana/docker-compose.yml down
	docker-compose -f ./ELK-Stack/docker-compose.yml down
	docker-compose -f ./inception/docker-compose.yml down

stop:
	docker-compose -f ./prom-garfana/docker-compose.yml stop
	docker-compose -f ./ELK-Stack/docker-compose.yml stop
	docker-compose -f ./inception/docker-compose.yml stop

start:
	docker-compose -f ./inception/docker-compose.yml start
	docker-compose -f ./ELK-Stack/docker-compose.yml start
	docker-compose -f ./prom-garfana/docker-compose.yml start

build:
	clear
	docker-compose -f ./inception/docker-compose.yml build
	docker-compose -f ./ELK-Stack/docker-compose.yml build
	docker-compose -f ./prom-garfana/docker-compose.yml build

clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $$(docker network ls -q) || true

re: clean up

du: down up

prune: clean
	@docker system prune -a --volumes -f

.PHONY: all up down stop start build clean re prune
