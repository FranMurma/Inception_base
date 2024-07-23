all: up

up:
	@docker-compose -f srcs/docker-compose.yml up --build

down:
	@docker-compose -f srcs/docker-compose.yml down -v

re: clean up

restart: clean
	@sudo rm -rf /home/frmurcia/data/mariadb
	@sudo rm -rf /home/frmurcia/data/wordpress
	@mkdir /home/frmurcia/data/mariadb
	@mkdir /home/frmurcia/data/wordpress

clean: down
	@docker rmi -f mariadb nginx wordpress
	@docker volume rm -f srcs_mariadb_data srcs_wordpress_data

.PHONY:
	all down clean re up restart
