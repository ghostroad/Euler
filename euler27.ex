import Utils
import Enum
import :math

defmodule Euler27 do
	def computeQuadratic(n, a, b) do
		n*n + a*n  + b
	end

	def isPrime(x) when x < 2, do: false
	def isPrime(x) do
		naturals |> from(2) |> upto(sqrt(x)) |> map(&(rem(x, &1) != 0)) |> all?
	end

	def numberOfPrimes(a, b) do
		naturals |> Stream.take_while(&(isPrime(computeQuadratic(&1, a, b)))) |> Enum.count
	end
end

numPrimes = for a <- -999..996 do
				if rem(a, 40) == 0, do: IO.puts(a)
				for b <- (a + 3)..999 do
					{a, b, Euler27.numberOfPrimes(a, b)}
				end
			end 

numPrimes |> Enum.map(&(Enum.max_by(&1, fn {_, _, n} -> n end))) |> Enum.max_by(fn {_, _, n} -> n end) |> IO.inspect

