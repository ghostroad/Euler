defmodule Utils do 

	def square(list), do: product(list, list)
	def product([], _list2), do: []
	def product([head | tail], list2) do
		(list2 |> Enum.map(&({head, &1}))) ++ product(tail, list2)
	end

	def naturals, do: Stream.iterate(1, &(&1+1))

	def upto(list, x) do
		list |> Stream.take_while(&(&1 <= x))
	end

	def from(list, x) do
		list |> Stream.drop_while(&(&1 < x))
	end
end