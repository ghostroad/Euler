import Enum

defmodule Euler3 do
	def	naturalsUpto(x) do
		Stream.iterate(1, &(&1+1)) |> Stream.take_while(&(&1 <= x))
	end

	def sqrt(x) do
		Float.floor(:math.sqrt(x))
	end

	def divides(x, y) do
		rem(x, y) == 0
	end

	def isPrime(1), do: false
	def isPrime(x) do
		naturalsUpto(sqrt(x)) |> drop(1) |> map(&(!divides(x, &1))) |> all?
	end

	def largestPrimeFactor(x) do
		naturalsUpto(sqrt(x)) 
		|> Stream.filter(&(rem(x, &1) == 0)) 
		|> Stream.map(&({&1, div(x, &1)})) 
		|> Stream.map(fn {f1, f2} -> (isPrime(f2) && f2) || (isPrime(f1) && f1) || 0 end)
		|> Enum.max
	end

end

for i <- 1..50 do
	IO.puts("#{i} #{Euler3.isPrime(i)}")
end
