defmodule Euler25 do
	def fib, do: Stream.unfold({1, 1}, fn {a, b} -> {a, {b, a + b}} end)
end

Euler25.fib |> Stream.take_while(fn n -> (n |> to_string |> String.length) < 1000 end) |> Enum.count |> IO.puts