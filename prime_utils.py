from itertools import *
import math

primes_cache = [2, 3, 5]

def primes():
    for p in primes_cache:
        yield p
    for n in count(primes_cache[-1] + 1):
        if any(n % d == 0 for d in takewhile(lambda x: x <= math.sqrt(n), primes_cache)):
            continue
        primes_cache.append(n)
        yield n


def primes_upto(n):
    return takewhile(lambda x: x <= n, primes())