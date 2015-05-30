multiplesOf3 = range(0, 1000, 3)
multiplesOf5 = range(0, 1000, 5)
multiplesOf15 = range(0, 1000, 15)

print sum(multiplesOf3) + sum(multiplesOf5) - sum(multiplesOf15)


def fib(upperLimit):
    a, b = 0, 1
    while a <= upperLimit:
        yield a
        a, b = b, a + b
        
print sum((i for i in fib(4000000) if i%2==0))