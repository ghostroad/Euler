defmodule Euler20 do
	def factorial(1), do: 1

	def factorial(n), do: n * factorial(n - 1)	
end

Euler20.factorial(100) |> to_string |> String.codepoints |> Enum.map(fn s -> Integer.parse(s) |> elem(0) end) |> Enum.sum |> IO.puts