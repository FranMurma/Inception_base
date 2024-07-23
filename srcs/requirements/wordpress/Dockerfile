# Baja el SO de debian, le dice a Docker con que sistema operativo debe ejecutarse la maquina virtual
FROM debian:buster

# RUN ejecuta un comando de terminal
# Actualiza el sistema e instala los paquetes necesarios
RUN apt-get update
RUN apt-get -y install php7.3 php-mysql php-fpm mariadb-server wget

# Exponemos el puerto 9000 que es donde estara wordpress
EXPOSE 9000

# Copy el fichero www.conf en php/7.3/fpm/pool.d
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d

# Copiamos el script
COPY ./tools/my_wordpress.sh /var/www/

# Le damos los permisos necesarios para lanzar el programa en el ordenador
RUN chmod +x /var/www/my_wordpress.sh

# Ejecutamos el wordpress siempre que el contenedor se inicia
ENTRYPOINT [ "/var/www/my_wordpress.sh" ]

# INICIAMOS PHP
CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]
