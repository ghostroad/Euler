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
		largestPossible = 2 * Enum.max(list)
		setOfSums = pairwiseSums(:array.new([{:size, largestPossible + 1}, 
											 {:default, false}, 
											 {:fixed, true}]), list, list) 
		naturals |> upto(largestPossible) |> Enum.filter(fn i -> setOfSums.get(i) end) 
	end

	def pairwiseSums(setOfSums, [], _list2), do: setOfSums

	def pairwiseSums(setOfSums, [head1 | tail1], list2) do
		Enum.reduce(list2, setOfSums, fn n, setOfSums -> setOfSums.set(n + head1, true) end)
		|> pairwiseSums(tail1, list2)
	end

end

abundants = Euler23.abundantNumbers |> upto(28123) |> Enum.to_list 

sumOfAbundantSums = Euler23.pairwiseSums(abundants) |> Enum.filter(&(&1 <= 28123)) |> Enum.sum

totalSum = div(28123 * 28124, 2)

remaining = totalSum - sumOfAbundantSums

IO.puts(remaining)
