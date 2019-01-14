FROM php:7.2-fpm

ARG DOCKER_USER=dockerUser
ARG PUID=1000
ARG PGID=1000

RUN groupadd -g $PGID $DOCKER_USER && useradd -u $PUID -g $DOCKER_USER -m $DOCKER_USER && adduser $DOCKER_USER sudo

RUN apt-get update && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get upgrade -y && \
    apt-get install -y git && \
    apt-get install -y gnupg && \
    apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip


RUN curl -s http://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

RUN chown $DOCKER_USER:$DOCKER_USER /usr/local/bin/composer

RUN mkdir -p /home/dockerUser/.composer/cache && chown dockerUser:dockerUser /home/dockerUser/.composer/cache \
&& chmod 777 -R /home/dockerUser/.composer

RUN curl -sL https://deb.nodesource.com/setup_9.x | bash && \
  apt-get -y install nodejs
  