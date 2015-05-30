defmodule Euler26 do
	def period(divisor) when divisor > 1 do
		{a, b} = repeatingCarries(divisor, HashDict.new, 0, 10)
		b - a
	end

	def repeatingCarries(divisor, carriesSoFar, currentIndex, currentCarry) do
		if (previousOccurence = Dict.get(carriesSoFar, currentCarry)) do
			{previousOccurence, currentIndex}
		else
			updatedCarries = Dict.put(carriesSoFar, currentCarry, currentIndex)
			newCarry = (currentCarry >= divisor) && rem(currentCarry, divisor) * 10 || currentCarry * 10
			repeatingCarries(divisor, updatedCarries, currentIndex + 1, newCarry)
		end
	end
end

2..999 |> Enum.max_by(fn i -> Euler26.period(i) end) |> IO.puts