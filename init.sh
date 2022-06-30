#!/bin/bash
source bash/library.sh

CONFIG_FILE=$PWD/.config
test -f $CONFIG_FILE || touch $CONFIG_FILE
source $CONFIG_FILE

if ( ! grep -q 'IS_NEW_INSTALL' $CONFIG_FILE ) then
    read -p "Do you want to install Wordpress from scratch? (y/n) " yn
	case $yn in
		[yY] )
			IS_NEW_INSTALL=true;;
		[nN] )
			IS_NEW_INSTALL=false;;
		* ) echo invalid response;
			exit 1;;
	esac
    echo 'IS_NEW_INSTALL='$IS_NEW_INSTALL >> $CONFIG_FILE
fi

if $IS_NEW_INSTALL
then
    source bash/new_install/init.sh
else
    source bash/existing/init.sh
fi

rm -r bash