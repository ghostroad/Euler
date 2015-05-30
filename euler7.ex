import Utils
import Enum
defmodule Euler7 do
	def doesNotDivide(divisors, x) do
		divisors |> map(&(rem(x, &1) != 0)) |> all?
	end

	def	naturalsUpto(x) do
		naturals |> upto(x)
	end

	def	naturalsFrom(x) do
		naturals |> from(x)
	end
end

