#!/bin/bash
REMOTE_SSH_HOST=$(get_config REMOTE_SSH_HOST "SSH hostname")
REMOTE_SSH_USER=$(get_config REMOTE_SSH_USER "SSH username")
REMOTE_DIR_LOCATION=$(read_input "Remote directory to download")
LOCAL_DIR_LOCATION=$(read_input "Local directory to paste files (leave empty if root)")

if [ ! -z "$LOCAL_DIR_LOCATION" ]
then
    LOCAL_DIR_LOCATION="/"$LOCAL_DIR_LOCATION
fi

if [[ ! -z "$REMOTE_SSH_USER" && ! -z "$REMOTE_SSH_HOST" && ! -z "$REMOTE_DIR_LOCATION" ]]
then
    scp -r -p $REMOTE_SSH_USER@$REMOTE_SSH_HOST:$REMOTE_DIR_LOCATION/* .$LOCAL_DIR_LOCATION
fi