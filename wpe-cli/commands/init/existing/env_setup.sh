#!/bin/bash

# Database
read -p "Do you want to download a remote database? (y/n) " yn
case $yn in
    [yY] )
        source $COMMANDS_PATH/db/import.sh
        ;;
    [nN] )
        read -p "Do you have a database SQL dump file in the project? (y/n) " yn
        case $yn in
            [yY] )
                DB_LOCAL_LOCATION=$(read_input "SQL dump file location?")
                mv $DB_LOCAL_LOCATION docker/mariadb-init/dump.sql;;
        esac;;
    * ) echo invalid response;
        exit 1;;
esac



# Project files
read -p "Do you want to download files project through SSH? (y/n) " yn
case $yn in
    [yY] )
        REMOTE_SSH_HOST=$(get_config REMOTE_SSH_HOST "SSH hostname")
        REMOTE_SSH_USER=$(get_config REMOTE_SSH_USER "SSH username")
        REMOTE_PROJET_DIR=$(read_input "Remote project dir")

        echo "
        REMOTE_SSH_HOST=$REMOTE_DB_NAME
        REMOTE_SSH_USER=$REMOTE_SSH_USER" >> docker/.env

        scp -r -p ${REMOTE_SSH_USER}@${REMOTE_SSH_HOST}:${REMOTE_PROJET_DIR}/* .
        ;;
esac

cd docker

if [ ! -z ${REMOTE_DB_HOST+x} ]
then
    source $COMMANDS_PATH/db/download.sh
fi

make
cd ..