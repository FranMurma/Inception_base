# Baja el SO de debian, le dice a Docker con que sistema operativo debe ejecutarse la maquina virtual
FROM debian:buster

# RUN ejecuta un comando de terminal
# Actualiza el sistema e instala los paquetes necesarios
# Cliente es un programa que permite entrar en la base de datos y cambiar cosas
RUN apt update -y && apt upgrade -y
RUN apt-get install mariadb-server -y

# Cuando creamos un nuevo contenedor, copiamos de nuestra carpeta al contenedor, porque esta vacio!!
# Copiamos los archivos donde son necesarios
COPY /conf/mysqld.conf /etc/mysql/conf.d/
COPY /conf/mysqld.conf /etc/mysql/mariadb.conf.d/

# Copiamos el archivo de configuracion
COPY /tools/mariadb.sh /mariadb.sh

# Damos los permisos necesarios
# RUN chmod +x /mariadb.sh

# Exponemos el puerto 3306 (SUBJECT)
EXPOSE 3306

# Ejecutamos el wordpress siempre que el contenedor se inicia
ENTRYPOINT ["bash", "/mariadb.sh"]

# CMD porque si falla, no cierra el contenedor
# INICIAMOS EL SERVICIO MARIADB 
CMD ["mysqld", "--bind-address=0.0.0.0"]
