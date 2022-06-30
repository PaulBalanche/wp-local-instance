#!/bin/bash
get_config () {

   if ( ! grep -q $1 $CONFIG_FILE ) then
		read -p "$2 [$3]: " VALUE
        VALUE=${VALUE:-$3}
		echo $1'='$VALUE >> $CONFIG_FILE
	fi

    echo $VALUE
}
