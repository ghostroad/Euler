import Utils
import Stream

defmodule Euler21 do
	
	def isAmicable(a) do
		b = sumOfProperDivisors(a)
		b != a and sumOfProperDivisors(b) == a 
	end

	def properDivisors n do
		naturals 
		|> from(2) 
		|> upto(:math.sqrt(n)) 
		|> filter(&(rem(n, &1) == 0)) 
		|> flat_map(fn divisor -> 
				otherDivisor = div(n, divisor)
				if (otherDivisor == divisor), do: [divisor], else: [divisor, otherDivisor]
			end)
	end

	def sumOfProperDivisors n do
		1 + Enum.sum(properDivisors n)
	end
end

Euler21.properDivisors(64) |> Enum.to_list |> inspect |> IO.puts
naturals |> upto(9999) |> filter(&Euler21.isAmicable/1) |> Enum.sum |> inspect |> IO.puts