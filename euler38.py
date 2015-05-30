import math
from itertools import *
def is_pandigital(n):
    return sorted(list(n)) == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

largest = 0
for n in range(2, 9):
    print "n: ", n
    for f in takewhile(lambda x: x <= 10**(9.0/n), count(1)):
        concat_prod = ''.join([str(f*i) for i in range(1, n+1)])
        if is_pandigital(concat_prod) and int(concat_prod) > largest:
            largest = int(concat_prod)
            print largest



