defmodule Helper do
	def _fact(0), do: 1
	def _fact(n) when n > 0, do: n * _fact(n - 1)
end

defmodule Euler34 do
	for digit <- 0..9 do
		def fact(unquote(digit)), do: unquote(Helper._fact(digit))
	end

	def is_sum_of_factorials n do
		sum_of_powers = n |> to_char_list |> Enum.map(fn a -> fact(a - 48) end) |> Enum.sum
		sum_of_powers == n
	end
end

3..2903040 |> Enum.filter(&Euler34.is_sum_of_factorials/1) |> Enum.sum |> IO.puts