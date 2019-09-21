#!/bin/bash

PATH=""
MSG=""

usage() {
	echo "Usage: $0 [-d PATH] [-m MESSAGE]
	-d, also copy to directory specified by PATH and try pushing there.
	-m, use MESSAGE as commit message." >&2
}

while getopts ":m:d:" OPT; do
	case ${OPT} in
		m )
			MSG=${OPTARG}
			if [ "${MSG}" = "" ]; then
				echo "invalid option: -${OPT} requires a non-empty string as argument." >&2
				exit 1
			fi
			;;
		d )
			PATH=${OPTARG}
			if ! [ -d "${PATH}" ]; then
				echo "invalid option: -${OPT} requires a valid path as argument." >&2
				exit 1
			fi
			;;
		: )
			echo "Invalid option: -${OPTARG} requires an argument" >&2
			exit 1
			;;
		\? )
			usage
			exit 1
			;;
	esac
done

echo "$(pwd | . /usr/bin/norminette)"
exit 0
