from itertools import *
import math

cache = {1: False}


def is_prime(n):
    if n in cache:
        return cache[n]
    else:
        return all(n % d for d in takewhile(lambda x: x <= math.sqrt(n), count(2)))

def lr_primes(length, suffix=''):
    if length == 0:
        suffix_as_num = int(suffix)
        if is_rl_prime(suffix_as_num): 
            yield suffix_as_num
        return

    for digit in ['1', '2', '3', '4', '5', '6', '7', '8', '9']:
        new_number_as_str = digit + suffix
        new_number = int(new_number_as_str)
        if is_prime(new_number):
            for extensions in lr_primes(length - 1, new_number_as_str):
                yield extensions

def is_rl_prime(number):
    number_as_str = str(number)
    return all(is_prime(int(number_as_str[0:i])) for i in range(1, len(number_as_str)))

p = (n for length in count(2) for n in lr_primes(length))

sum = 0
for i in range(11):
    sum = sum + p.next()

print sum