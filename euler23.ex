import Euler21
import Utils

defmodule Euler23 do

	def isAbundant(n) do
		sumOfProperDivisors(n) > n
	end

	def abundantNumbers do
		naturals |> Stream.filter(&isAbundant/1)
	end

	def pairwiseSums(list) do
		pairwiseSums(HashDict.new, list, list) |> Dict.keys
	end

	def pairwiseSums(map, [], _list2), do: map

	def pairwiseSums(map, _list1, []), do: map

	def pairwiseSums(map, [head1 | tail1], [head2 | tail2]) do
		map |> Dict.put(head1 + head2, true) |> pairwiseSums([head1], tail2) |> pairwiseSums(tail1, [head2]) |> pairwiseSums(tail1, tail2)
	end
end

abundants = Euler23.abundantNumbers |> upto(28123) |> Enum.to_list

# sumOfAbundantSums = Euler23.pairwiseSums(abundants) |> Enum.filter(&(&1 <= 28123)) |> Enum.sum

# totalSum = div(28123 * 28124, 2)

# remaining = totalSum - sumOfAbundantSums

# IO.puts(remaining)

[1, 2, 3] |> square |> inspect |> IO.puts

abundants |> square |> Enum.map(fn {a, b} -> a + b end) |> Enum.filter(&(&1 <= 28123)) |> Enum.uniq |> Enum.sum |> IO.puts