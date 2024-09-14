PATH := ${PATH}:/home/arazzok/.docker/cli-plugins

all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v

fclean: down
				docker system prune -af --volumes
				rm -rf /home/arazzok/data/mariadb/*
				rm -rf /home/arazzok/data/wordpress/*

re: fclean all
