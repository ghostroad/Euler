from itertools import *

def is_palindromic(n):
    decimal = str(n)
    binary = bin(n)[2:]
    return decimal == ''.join(reversed(decimal)) and binary == ''.join(reversed(binary))

print sum(ifilter(is_palindromic, xrange(1000000)))
