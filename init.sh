#!/bin/bash

read -p "Do you want to install Wordpress from scratch? (y/n) " yn
case $yn in 
	[yY] )
        echo ''
        echo '#################################### Bedrock init ####################################'
        echo ''
        source bash/0_bedrock_init.sh

        echo ''
        echo ''
        echo ''
        echo '#################################### Env setup ####################################'
        echo ''
        source bash/1_env_setup.sh;;
	[nN] )

        echo ''
        echo ''
        echo ''
        echo '#################################### Basic Wordpress import ####################################'
        echo ''
        source bash/2_basic_wp_import.sh;;
	* ) echo invalid response;
		exit 1;;
esac

rm -r bash
rm init.sh