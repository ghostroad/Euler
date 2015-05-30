import :math
import Stream

defmodule Exercise do 
	def naturals, do: iterate(1, &(&1+1))

	def upto(list, x) do
		list |> take_while(&(&1 <= x))
	end

	def from(list, x) do
		list |> drop_while(&(&1 < x))
	end

	def does_not_divide(divisors, x) do
		divisors |> map(&(rem(x, &1) != 0)) |> Enum.all?
	end

	def primes do 
		transform(naturals |> from(2), :ordsets.new(), 
		fn current, primes_so_far -> 
			if (primes_so_far |> upto(sqrt(current)) |> does_not_divide(current)) do
				{[current], :ordsets.add_element(current, primes_so_far)}
			else
				{[], primes_so_far}
			end
		end)
	end
end	

Exercise.primes |> Exercise.upto(1000000) |> Enum.sum |> IO.puts
