import Utils

defmodule Euler28 do
	def cornerNumbers(1), do: [1]
	def cornerNumbers(layer) do
		previousNumbers = cornerNumbers(layer - 1)
		lastNumber = List.first(previousNumbers)
		newCorners = naturals |> from(lastNumber) |> Stream.take_every(2*(layer - 1)) |> Stream.drop(1) |> Enum.take(4) |> Enum.reverse
		newCorners ++ previousNumbers
	end
end

Euler28.cornerNumbers(501) |> Enum.sum |>  IO.inspect