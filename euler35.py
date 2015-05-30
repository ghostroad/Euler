from collections import deque

from itertools import *
import math

def primes():
    primes_so_far = []
    for n in count(2):
        if any(n % d == 0 for d in takewhile(lambda x: x <= math.sqrt(n), primes_so_far)):
            continue
        primes_so_far.append(n)
        yield n

set_of_primes = set(takewhile(lambda x: x < 1000000, primes()))

def is_circular(n):
    d = deque(str(n))
    for i in range(len(d)):
        d.rotate()
        if int(''.join(d)) not in set_of_primes:
            return False
    return True

print sum(1 for i in ifilter(is_circular, set_of_primes))




