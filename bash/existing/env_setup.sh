#!/bin/bash
PROJECT_NAME=$(basename "$PWD")

read -p 'WP_HOME (without protocol, without port) ['$PROJECT_NAME'.local.buzzbrothers.ch]: ' WP_HOME
WP_HOME=${WP_HOME:-$PROJECT_NAME.local.buzzbrothers.ch}

read -p 'HTTP protocol [http]: ' HTTP_PROTOCOL
HTTP_PROTOCOL=${HTTP_PROTOCOL:-http}

read -p 'PUBLIC_PORT [8000]: ' PUBLIC_PORT
PUBLIC_PORT=${PUBLIC_PORT:-8000}

read -p 'Wordpress files location (leave empty if root): ' SERVER_DOCUMENT_ROOT
if [ -z "$SERVER_DOCUMENT_ROOT" ]; then SERVER_DOCUMENT_ROOT=""; else SERVER_DOCUMENT_ROOT="/"$SERVER_DOCUMENT_ROOT; fi

read -p 'Database name [wordpress]:' DB_NAME
DB_NAME=${DB_NAME:-wordpress}

read -p 'Database user [wordpress]: ' DB_USER
DB_USER=${DB_USER:-wordpress}

read -sp 'Database password [wordpress]: ' DB_PASSWORD
DB_PASSWORD=${DB_PASSWORD:-wordpress}
echo "";

read -p 'Database host [mariadb]: ' DB_HOST
DB_HOST=${DB_HOST:-mariadb}

read -p 'Database table prefix [wp_]: ' DB_PREFIX
DB_PREFIX=${DB_PREFIX:-wp_}

WP_ADMIN_USER='imported...'
WP_ADMIN_PASSWORD='imported...'
WP_ADMIN_EMAIL='imported...'

echo "### Documentation available at https://wodby.com/docs/stacks/wordpress/local
### Changelog can be found at https://github.com/wodby/docker4wordpress/releases
### Images tags format explained at https://github.com/wodby/docker4wordpress#images-tags

### PROJECT SETTINGS

PROJECT_NAME=$PROJECT_NAME
PROJECT_BASE_URL=$WP_HOME
PROJECT_HTTP_PROTOCOL=$HTTP_PROTOCOL
PROJET_PUBLIC_PORT=$PUBLIC_PORT

SERVER_DOCUMENT_ROOT=$SERVER_DOCUMENT_ROOT

DB_NAME=$DB_NAME
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
DB_ROOT_PASSWORD=$DB_PASSWORD
DB_HOST=$DB_HOST
DB_CHARSET=utf8

WP_ADMIN_USER=$WP_ADMIN_USER
WP_ADMIN_PASSWORD=$WP_ADMIN_PASSWORD
WP_ADMIN_EMAIL=$WP_ADMIN_EMAIL

# You can generate these using the https://roots.io/salts.html Roots.io secret-key service
# Supported by vanilla WP image only, see docker-compose.override.yml
# If not specified, generated automatically
#WP_AUTH_KEY='generateme'
#WP_AUTH_SALT='generateme'
#WP_SECURE_AUTH_KEY='generateme'
#WP_SECURE_AUTH_SALT='generateme'
#WP_LOGGED_IN_KEY='generateme'
#WP_LOGGED_IN_SALT='generateme'
#WP_NONCE_KEY='generateme'
#WP_NONCE_SALT='generateme'

# Accepted values are 'direct', 'ssh2', 'ftpext', 'ftpsockets', or 'false' to omit the
# constant letting WordPress determine the best method. Defaults to 'direct' if undefined.
FS_METHOD=direct

### --- MARIADB ----

MARIADB_TAG=10.8-3.21.0
#MARIADB_TAG=10.7-3.21.0
#MARIADB_TAG=10.6-3.21.0
#MARIADB_TAG=10.5-3.21.0
#MARIADB_TAG=10.4-3.21.0
#MARIADB_TAG=10.3-3.21.0

### --- VANILLA WORDPRESS ----

WORDPRESS_TAG=6-4.54.0

### --- PHP ----

# Linux (uid 1000 gid 1000)

#PHP_TAG=8.1-dev-4.38.3
#PHP_TAG=8.0-dev-4.38.3
#PHP_TAG=7.4-dev-4.38.3

# macOS (uid 501 gid 20)

PHP_TAG=8.0-dev-macos-4.38.3
#PHP_TAG=7.4-dev-macos-4.38.3

### --- NGINX ----

NGINX_TAG=1.21-5.25.1
#NGINX_TAG=1.20-5.25.1
#NGINX_TAG=1.19-5.25.1

### --- REDIS ---

REDIS_TAG=7-3.14.1
#REDIS_TAG=6-3.14.1
#REDIS_TAG=5-3.14.1

### --- NODE ---

NODE_TAG=16-dev-1.2.0
#NODE_TAG=14-dev-1.2.0
#NODE_TAG=12-dev-1.2.0

### --- VARNISH ---

VARNISH_TAG=6.0-4.11.0
#VARNISH_TAG=4.1-4.11.0

### --- SOLR ---

SOLR_TAG=8-4.18.0
#SOLR_TAG=7-4.18.0
#SOLR_TAG=6-4.18.0
#SOLR_TAG=5-4.18.0

### --- ELASTICSEARCH ---

ELASTICSEARCH_TAG=7-5.18.2
#ELASTICSEARCH_TAG=6-5.18.2

### --- KIBANA ---

KIBANA_TAG=7-5.18.2
#KIBANA_TAG=6-5.18.2

### OTHERS

ADMINER_TAG=4-3.23.3
APACHE_TAG=2.4-4.10.1
ATHENAPDF_TAG=2.16.0
MEMCACHED_TAG=1-2.13.0
OPENSMTPD_TAG=6-1.14.0
RSYSLOG_TAG=latest
WEBGRIND_TAG=1-1.28.5
XHPROF_TAG=3.6.3" > docker/.env

mv db.sql docker/mariadb-init/db.sql

cd docker
make

cd ..