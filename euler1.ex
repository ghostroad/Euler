defmodule Euler1 do
    def sum([]), do: 0
    def sum([head | tail]), do: head + sum(tail)
end

threes = Euler1.sum(Enum.take_every(0..999, 3))
fives = Euler1.sum(Enum.take_every(0..999, 5))
fifteens = Euler1.sum(Enum.take_every(0..999, 15))
IO.puts(threes + fives - fifteens)
