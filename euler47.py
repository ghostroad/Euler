from itertools import *
from prime_utils import *

N = 4

def has_n_factors(n, m):
    num_factors = 0
    for p in primes_upto(m / 2.0):
        if m % p == 0:
            num_factors += 1
            if num_factors > n:
                return False
    return num_factors == n

run = 0
for m in count(201):
    if has_n_factors(N, m):
        run += 1
    else:
        run = 0
    if run == N:
        print(m - N + 1)
        break