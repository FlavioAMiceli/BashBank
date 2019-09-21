#! /bin/bash

# The prime factors of 13195 are 5, 7, 13 and 29.

# What is the largest prime factor of the number 600851475143 ?

find_next_prime()
{
  PRIMES=$1
  echo "PRIMES is ${PRIMES[*]}"
  C=${PRIMES[(${#PRIMES[@]} - 1)]}
  echo "CANDIT is $C"
  NOT_PRIME=true
  while $NOT_PRIME; do
    echo "C was $C"
    C=$((C + 2))
    echo "C now $C"
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

N=$1
PRIMES=(2 3)
PFD=()
for P in "${PRIMES[@]}"; do
  while (( N % P == 0)); do
    N=$((N / P))
    PFD+=("$P")
  done
done
while (( N > 1 )); do
  P=$(find_next_prime "${PRIMES[@]}")
  PRIMES+=("$P")
  while (( N % P == 0)); do
    N=$((N / P))
    PFD+=("$P")
  done
done
echo "${PFD[@]}"
