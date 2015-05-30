defmodule Euler24 do
	def fact(1), do: 1
	def fact(n), do: n * fact(n - 1)

	def permutationAt(remainingDigits, _) when (tuple_size(remainingDigits) == 1), do: [remainingDigits |> elem(0)]

	def permutationAt(remainingDigits, ordinal) do
		base = fact(tuple_size(remainingDigits) - 1)
		firstDigitIndex = div(ordinal, base)
		firstDigit = remainingDigits |> elem(firstDigitIndex)
		[firstDigit] ++ permutationAt(remainingDigits |> Tuple.delete_at(firstDigitIndex), ordinal - (base * firstDigitIndex))
	end


end

Euler24.permutationAt({0, 1, 2, 3, 4, 5, 6, 7, 8, 9}, 999999) |> inspect |> IO.puts

