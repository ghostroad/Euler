digits = [None] * 302
digits[0] = 2

def double():
	carry = 0
	for i in range(len(digits)):
		currentDigit = digits[i]
		if currentDigit is None:
			if carry == 1:
				digits[i] = 1
			break
		newDigit = ((currentDigit*2) % 10) + carry
		carry = ((currentDigit*2) > 9) and 1 or 0
		digits[i] = newDigit


for i in range(999):
	double()


print sum(digits)


