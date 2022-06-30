#!/bin/bash

read -p "Do you want to install Wordpress from scratch? (y/n) " yn
case $yn in
	[yY] )
                source bash/new_install/init.sh;;
	[nN] )
                source bash/existing/init.sh;;
	* ) echo invalid response;
		exit 1;;
esac

rm -r bash