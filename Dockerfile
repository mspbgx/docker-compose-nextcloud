version: '2'

volumes:
  nextcloud: /opt/Docker/nextcloud/data/
  mariadb: /opt/Docker/nextcloud/data/

services:
  mariadb:
    image: mariadb
    restart: always
    volumes:
      - mariadb:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=P4$$W0RD
      - MYSQL_DATABASE=nextcloud
      - MYSQL_USER=nextcloud
      - MYSQL_PASSWORD=P4$$W0RD

  app:
    image: nextcloud
    ports:
      - 8080:80
    links:
      - mariadb
    volumes:
      - nextcloud:/var/www/html
    restart: always
