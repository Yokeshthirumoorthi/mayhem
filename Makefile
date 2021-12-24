#!make
DOCKER_COMPOSE = ./docker-compose.yml

build:
	docker build -t mayhem:latest ./

dev-up:
	docker-compose -f ${DOCKER_COMPOSE} up --remove-orphans  -d
