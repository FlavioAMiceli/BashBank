#! /bin/bash

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

find_next_prime()
{
  PRIMES=$1
  C=${PRIMES[-1]}
  NOT_PRIME=true
  while $NOT_PRIME; do
    C=$((C + 2))
    NOT_PRIME=false
    for P in "${PRIMES[@]}"; do
      if ((P < C / P)) && ((C % P != 0)); then
        NOT_PRIME=true
        break
      fi
    done
  done
  echo "$C"
}

PFD=()
PRIMES=(2)
C=3
N=$1
while (( N > 1 )); do
  P=$(find_next_prime "${PRIMES[@]}")
  PRIMES+=("$P")
  while (( N % P == 0)); do
    N=$((N / P))
    PFD+=("$P")
  done
done
echo "${PFD[@]}"
