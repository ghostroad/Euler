import Enum

defmodule Euler31 do
	def coin_values, do: {200, 100, 50, 20, 10, 5, 2, 1}

	def breakdowns(remaining_coins, deficit) when tuple_size(remaining_coins) == 1, do: [[div(deficit,elem(remaining_coins, 0))]]

	def breakdowns(remaining_coins, deficit) do
		highest_value = elem(remaining_coins, 0)
		quotient = div(deficit, highest_value)
		0..quotient |> flat_map(fn q -> 
								breakdowns(Tuple.delete_at(remaining_coins, 0), deficit - (highest_value * q))
								|> map(fn breakdown -> [q] ++ breakdown end)
							end)
	end
end

Euler31.breakdowns(Euler31.coin_values, 200) |> Enum.count |> IO.inspect