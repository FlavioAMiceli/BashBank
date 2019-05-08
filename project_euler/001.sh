#! /bin/sh

# If we list all the natural numbers below 10 that are multiples of 3 or 5,
# we get 3, 5, 6 and 9.
#
# The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

SUM=0
for N in {3..999}; do
	if (( N % 3 == 0 )) || (( N % 5 == 0 )); then
		SUM=$((SUM + N))
	fi
done
echo "$SUM"
