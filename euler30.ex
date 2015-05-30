defmodule Euler30 do
	def isSumOfFifthPowers n do
		sumOfPowers = n |> to_char_list |> Enum.map(fn a -> :math.pow(a - 48, 5) end) |> Enum.sum
		sumOfPowers == n
	end
end

2..999_999 |> Enum.filter(&Euler30.isSumOfFifthPowers/1) |> Enum.sum |> IO.puts