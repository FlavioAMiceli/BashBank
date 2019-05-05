#! /bin/sh

HAYSTACK=($1)
NEEDLE=$2
DELIM=" "
while getopts ":d:" OPT; do
	case $OPT in
		d )
			DELIM=$OPTARG
			if [ ${#DELIM} -ne 1 ]; then
				echo "Invalid use: [-d] takes a single character as argument." >&2
				exit 1
			fi
			;;
		\? )
			echo "usage: word_search.sh haystack needle [-d delim]" >&2
			exit 1
			;;
		: )
			echo "Invalid option: -$OPT requires an argument" >&2
			exit 1
			;;
	esac
done
INDEX=0
IFS=$DELIM
LEN=${#HAYSTACK[@]}
while (( $INDEX < $LEN )) && [[ "${HAYSTACK[$INDEX]}" != "$NEEDLE" ]]; do
	((INDEX++))
done
if (( $INDEX < $LEN)); then
	echo "$((INDEX + 1))"
fi
