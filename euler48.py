from itertools import *
from functools import reduce 

M = 10000000000

def exp(n):
    result = n % M
    for i in range(n - 1):
        result = (result * n) % M
    return result

def add(m, n):
    return ((m % M) + (n % M)) % M

print(reduce(add, (exp(n) for n in range(1000)), 0))