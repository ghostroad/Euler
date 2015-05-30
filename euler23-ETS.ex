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

        tbl = :ets.new(:table, [])
        pairwiseSums(tbl, list, list)

        naturals |> upto(largestPossible) |>  Enum.filter(fn i -> :ets.lookup(tbl, i) != [] end)
    end

    def pairwiseSums(_key, [], _list2), do: nil

    def pairwiseSums(key, [head1 | tail1], list2) do
        Enum.map(list2, &(:ets.insert(key, {&1 + head1, :true})))
        pairwiseSums(key, tail1, list2)
    end

end

abundants = Euler23.abundantNumbers |> upto(28123) |> Enum.to_list 

sumOfAbundantSums = Euler23.pairwiseSums(abundants) |> Enum.filter(&(&1 <= 28123)) |> Enum.sum

totalSum = div(28123 * 28124, 2)

remaining = totalSum - sumOfAbundantSums

IO.puts(remaining)
