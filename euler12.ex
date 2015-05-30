import Utils
import Stream
defmodule Euler12 do
	
	def numFactorsOfTriangle(n) do
		if rem(n, 2) == 0 do
			divisors(div(n, 2)) * divisors(n+1)
		else
			divisors(div(n+1, 2)) * divisors(n)
		end
	end

	def isPerfectSquare(n) do
		(:math.sqrt(n) |> Float.floor |> :math.pow(2)) == n
	end

	def doubleAndCorrect count, n do
		if (isPerfectSquare(n)), do: (2 * count) - 1, else: 2 * count
	end

	def divisors n do
		naturals |> from(1) |> upto(:math.sqrt(n)) |> filter(&(rem(n, &1) == 0)) |> Enum.count |> doubleAndCorrect(n)
	end
end

naturals |> drop_while(&(Euler12.numFactorsOfTriangle(&1) <= 500)) |> Enum.take(1) |> inspect |> IO.puts

