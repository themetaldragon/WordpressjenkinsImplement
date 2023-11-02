# Use an official Ubuntu base image
FROM ubuntu

# Set environment variables to avoid interactive prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=UTC


# Update package lists and install packages without prompts
RUN apt-get update && \
    apt-get install -yq --no-install-recommends \
    apache2 \
    php \
    php-mysql \
    php-curl \
    php-gd \
    php-json \
    php-mbstring \
    php-xml \
    mysql-server \
    php-zip \
    wget \
    libapache2-mod-php && \
    rm -rf /var/lib/apt/lists/*

# Create a directory for WordPress installation
RUN mkdir -p /var/www/html

RUN apt-get update && \
    apt-get install -y ca-certificates && \
    rm -rf /var/lib/apt/lists/*
# Download and extract WordP
RUN wget -P /var/www/html https://wordpress.org/latest.tar.gz && \
    tar -xzvf /var/www/html/latest.tar.gz -C /var/www/html/ && \
    rm /var/www/html/latest.tar.gz

# Set the working directory
WORKDIR /var/www/html

# Expose port 80 for Apache
EXPOSE 80
COPY ./wp-config-sample.php wordpress/wp-config-sample.php

COPY ./000-default.conf /etc/apache2/sites-enabled/000-default.conf
# Create a custom entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the custom entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
