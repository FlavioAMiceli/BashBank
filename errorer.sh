#!/usr/bin/env bash

IFS=$'\n'
ERROR=0
for LINE in $(pwd | perl /usr/bin/norminette); do
	if [[ $LINE =~ ^Error ]]; then
		ERROR=1
	elif [[ $ERROR -eq 1 ]] && [[ $LINE =~ ^Norm ]]; then
		exit 0
	fi
	echo $LINE
done
exit 0

grep "^Error"
