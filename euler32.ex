import :math
import Utils

defmodule Euler32 do
	def isPandigitalProduct(n) do
		naturals |> upto(sqrt(n)) |> Stream.map(&(isPandigitalProduct(n, &1))) |> Enum.any?
	end

	def isPandigitalProduct(n, d) when rem(n, d) == 0 do
		q = div(n, d)
		(digits(q) ++ digits(n) ++ digits(d) |> Enum.sort) == ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
	end

	def isPandigitalProduct(_, _), do: false


	def digits(n) do
		n |> to_string |> String.codepoints
	end

end

1000..9999 |> Enum.filter(&Euler32.isPandigitalProduct/1) |> Enum.sum |> IO.puts