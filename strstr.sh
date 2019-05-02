#!/bin/sh

HAYSTACK=$1
NEEDLE=$2
DELIM=" "
while getopts ":d:" opt; do
	case ${opt} in
		d )
			if [ ${#DELIM[@]} -neq 1 ]; then
				echo "Invalid use: [-d] takes a single character as argument."
				return
			fi
			DELIM=$OPTARG
			;;
		\? )
			echo "usage: haystack needle [-d delim]"
			;;
		: )
			echo "Invalid option: $OPTARG requires an argument"
			return
			;;
	esac
done
INDEX=1
while [ "${cut -d$DELIM -f$INDEX}" != "$NEEDLE" ]; do
	INDEX++
done
shift $((OPTIND -1))
echo "${cut -d$DELIM INDEX}"
