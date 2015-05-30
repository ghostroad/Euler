import Utils
import Euler21

defmodule Euler23 do

	def isAbundant(n) do
		sumOfProperDivisors(n) > n
	end

	def abundantNumbers do
		naturals |> Stream.filter(&isAbundant/1)
	end

	def pairwiseSums(list) do
		pairwiseSums(HashSet.new, list, list) 
	end

	def pairwiseSums(soFar, [], _list2), do: soFar

	def pairwiseSums(soFar, [head1 | tail1], list2) do
		Enum.reduce(list2, soFar, fn n, soFar -> Set.put(soFar, n + head1) end)
		|> pairwiseSums(tail1, list2)
	end

end

abundants = Euler23.abundantNumbers |> upto(28123) |> Enum.to_list

for i <- abundants do
	for j <- abundants

sumOfAbundantSums = Euler23.pairwiseSums(abundants) |> Enum.filter(&(&1 <= 28123)) |> Enum.sum

totalSum = div(28123 * 28124, 2)

remaining = totalSum - sumOfAbundantSums

IO.puts(remaining)
