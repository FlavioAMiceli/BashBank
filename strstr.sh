#! /bin/sh

if (( $# != 2 )); then
	echo "Usage: strstr.sh haystack needle" >&2
	exit 1
fi
HAYSTACK=$1
LEN_HAYSTACK=${#HAYSTACK}
NEEDLE=$2
LEN_NEEDLE=${#NEEDLE}
INDEX=0
while (( $((INDEX + LEN_NEEDLE)) < LEN_HAYSTACK )); do
	if [[ "${HAYSTACK:INDEX:LEN_NEEDLE}" == "$NEEDLE" ]]; then
		echo "$INDEX"
		exit 0
	fi
	((INDEX++))
done
