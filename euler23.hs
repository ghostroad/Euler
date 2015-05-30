
naturals = numsFrom 1

numsFrom n = n : numsFrom(n + 1)

upto :: Ord a => 

isAbundant :: Integer -> Bool
isAbundant n = (sumOfProperDivisors n) > n

sumOfProperDivisors :: Integer -> Integer
sumOfProperDivisors n = sum $ properDivisors n 

properDivisors :: Integer -> [Integer]
properDivisors n = [2, 3, 4]

main = putStrLn $ show $ take 10 naturals
