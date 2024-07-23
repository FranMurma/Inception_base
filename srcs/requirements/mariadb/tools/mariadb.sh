#!/bin/sh

# Cambiar permisos del directorio montado
chmod -R 777 /var/lib/mysql

# INICIAMOS mysql para ejecutar los comandos
service mysql start;

# Creamos un database con las variables de entornp
mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_DATABASE};"

# Creamos un usuario
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# Anadimos un usuario root en 127.0.0.1 para permitir la conexion remota
# El comando de FLUSH PRIVILEGES se usa para que las tablas sql se actualicen automaticamente cuando las modifiques
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"

# Le damos permisos a root
# Le damos una contrasena a root porque no tiene por defecto
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"

# Recargamos database de privilegios
mysql -e "FLUSH_PRIVILEGES;"

# Cerramos root
mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown

# STOP mysql
service mysql stop

# EJECUTAR mysql
exec "$@"

# docker ps  para saber contenedores
# docker exec -t contenedor /bin/bash  para entrar en la teminal y poder probar sql

#       mysql -u root -p
# Para que me ensene una database:
#       show databases;
# Para que me ensene el user y el host
#       select user, host from mysql.user; 
# Si quieres crear una tabla:
#       use database_inception;
#       CREATE TABLE table_name(       id int NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'Primary Key',     create_time DATETIME COMMENT 'Create Time',     name VARCHAR(255) );
#       show tables from database_inception

#docker exec -it mariadb sh
#mysql -u root -p
