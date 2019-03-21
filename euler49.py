from itertools import *
from prime_utils import * 

four_digit_primes = set(p for p in takewhile(lambda x: x < 10000, primes()) if p>1000)

def digits(p):
    return sorted(list(str(p)))

for p in four_digit_primes:
    for q in (q for q in four_digit_primes if q > p):
        r = 2 * q - p
        if r in four_digit_primes:
            if digits(p) == digits(q) and digits(p) == digits(r):
                print(p, q, r)