#!/bin/bash
get_config () {

    if ( ! grep -q $1 $CONFIG_FILE ) then
		read -p "$2 [$3]: " VALUE
        VALUE=${VALUE:-$3}
		echo $1'="'$VALUE'"' >> $CONFIG_FILE
    else
        VALUE=$(printf '%s\n' "${!1}")
	fi

    echo $VALUE
}

get_secret () {

	read -p "$2 [$3]: " VALUE
    VALUE=${VALUE:-$3}

    echo $VALUE
}
