import sys
def pp(s):
    sys.stdout.write(s)

for i in range(1, 101):
    if i % 3 == 0: pp("Fizz")
    if i % 5 == 0: pp("Buzz")
    if i % 3 and i % 5: pp(str(i))
    pp("\n")