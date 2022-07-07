#!/bin/bash
echo "DB_NAME='$DB_NAME'
DB_USER='$DB_USER'
DB_PASSWORD='$DB_PASSWORD'

# Optionally, you can use a data source name (DSN)
# When using a DSN, you can remove the DB_NAME, DB_USER, DB_PASSWORD, and DB_HOST variables
# DATABASE_URL='mysql://database_user:database_password@database_host:database_port/database_name'

# Optional database variables
DB_HOST='$DB_HOST'
DB_PREFIX='$DB_PREFIX'

WP_ENV='development'
WP_HOME='$HTTP_PROTOCOL://$WP_HOME:$PUBLIC_PORT'
WP_SITEURL=\"\${WP_HOME}/wp\"

# Specify optional debug.log path
# WP_DEBUG_LOG='/path/to/debug.log'

# Generate your keys here: https://roots.io/salts.html
AUTH_KEY='generateme'
SECURE_AUTH_KEY='generateme'
LOGGED_IN_KEY='generateme'
NONCE_KEY='generateme'
AUTH_SALT='generateme'
SECURE_AUTH_SALT='generateme'
LOGGED_IN_SALT='generateme'
NONCE_SALT='generateme'" > .env