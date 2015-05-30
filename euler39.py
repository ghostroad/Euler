from __future__ import division
import math

def myrange(smallest, largest):
    return range(int(smallest), int(largest) + 1)

def side_lengths(perimeter):
    min_largest = math.ceil(perimeter/3)
    for largest in myrange(min_largest, perimeter - 2):
        max_second_largest = min(largest - 1, perimeter - 1 - largest)
        min_second_largest = math.ceil((perimeter - largest)/2)
        for second_largest in myrange(min_second_largest, max_second_largest):
            third = perimeter - (largest + second_largest)
            if largest**2 == second_largest**2 + third**2:
                yield (third, second_largest, largest)

numsolutions = [(sum(1 for sls in side_lengths(perimeter)),perimeter) for perimeter in myrange(3, 1000)]

print max(numsolutions)
