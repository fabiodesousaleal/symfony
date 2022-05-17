FROM ubuntu/apache2:2.4-20.04_beta

ARG DEBIAN_FRONTEND=noninteractive
ARG php_version="8.1"

ARG server_name="localhost"
ARG composer_version="2"
ARG tz="America/Belem"
ARG port="80"

ENV TZ ${tz}

WORKDIR /var/www/html

RUN apt-get update && apt-get install -y ca-certificates apt-transport-https apt-utils software-properties-common vim\
    && add-apt-repository -y ppa:ondrej/php \
    && apt-get update -y \
    && apt-get upgrade -y

RUN apt-get install -y --allow-downgrades --allow-remove-essential --allow-change-held-packages \
                php${php_version}\
                php${php_version}-cli \
                php${php_version}-bcmath \
                php${php_version}-bz2 \
                php${php_version}-common \
                php${php_version}-curl \
                php${php_version}-gd \
                php${php_version}-gmp \
                php${php_version}-imap \
                php${php_version}-intl \
                php${php_version}-ldap \
                php${php_version}-mbstring \
                php${php_version}-mysql \
                php${php_version}-opcache \
                php${php_version}-pgsql \
                php${php_version}-phpdbg \
                php${php_version}-pspell \
                php${php_version}-readline \
                php${php_version}-soap \
                php${php_version}-tidy \
                php${php_version}-xml \
                php${php_version}-xmlrpc \
                php${php_version}-xsl \
                php${php_version}-zip \
                libapache2-mod-php${php_version}
RUN a2enmod rewrite \
    && rm /etc/localtime \
    && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

RUN apt-get clean \
    && apt-get autoremove --purge -y \ 
    && rm -rf /var/lib/apt/lists/* \
    && echo "ServerName "${server_name} >> /etc/apache2/apache2.conf \
    && rm -f index.html

#INSTALL SYMFONY-CLI ()
RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list \
    && apt update \ 
    && apt install symfony-cli -y
    
EXPOSE ${port}