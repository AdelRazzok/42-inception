# TODO: Add sudo and changes volumes path on 42 devices

all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down -v

fclean: down
				docker system prune -af --volumes
# rm -rf /c/Users/skurt/Desktop/mariadb
# rm -rf /c/Users/skurt/Desktop/wordpress

re: fclean all
