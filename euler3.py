import math

n = 600851475143

def largestPrimeFactor(x):
	largest = 0
	max = math.sqrt(x)
	factor1 = 1
	while factor1 <=  max:
		if x % factor1 == 0:
			factor2 = x/factor1
			if isPrime(factor1):
				largest = factor1
			if isPrime(factor2):
				return factor2

		factor1 += 1
	return largest

def isPrime(x):
	max = math.sqrt(x)
	return all(map(lambda d: x % d, range(2, int(max) + 1)))


print largestPrimeFactor(n)
