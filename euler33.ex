import Utils

defmodule Euler33 do
	def digits, do: [1, 2, 3, 4, 5, 6, 7, 8, 9]

	def curious_fractions do
		digits 
		|> Enum.flat_map(fn digit -> digits |> upto(digit) |> Enum.map(&({&1, digit})) end)
		|> Enum.flat_map(fn {a, b} -> digits |> from(a + 1) |> Enum.map(&({{a, b}, {b, &1}})) end)
		|> Enum.filter(&is_curious/1)
	end

	def is_curious({{a, b}, {b, c}}) do
		a/c == ((10 * a) + b)/((10*b) + c)
	end
end

Euler33.curious_fractions |> IO.inspect