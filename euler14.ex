defmodule Euler14 do
	def collatzCount(1), do: 1

	def collatzCount(n) when n > 1 do
		if rem(n, 2) == 0, do: 1 + collatzCount(div(n, 2)), else: 1 + collatzCount(3*n + 1)
	end
end

1..999999 |> Enum.map(&({&1, Euler14.collatzCount(&1)})) |> Enum.max_by(fn {i, count} -> count end) |> IO.puts