import Utils

defmodule Euler9 do 
	def generatePossibleTriples(sum) do
		naturals |> Stream.take_while(&((3*&1) + 3) <= sum) |> generatePossibleTriples(sum)
	end

	def generatePossibleTriples(firstValues, sum) do
		Enum.reduce(firstValues, [], fn (a, tuplesSoFar) ->
			tuplesSoFar ++ Enum.to_list(naturals 
							|> from(a + 1) 
							|> Stream.take_while(&((a + (2*&1) + 1)  <= sum))
							|> Stream.map(&({a, &1, sum - a - &1})))
			end)
	end
end


Euler9.generatePossibleTriples(1000) |> Enum.filter(fn {a, b, c} -> a*a + b*b == c*c end) |> Enum.take(1) |> inspect |> IO.puts 

Euler9.generatePossibleTriples(1000) |> Enum.map(fn {a, _, _} -> a end) |> Enum.take(1) |> inspect |> IO.puts 
