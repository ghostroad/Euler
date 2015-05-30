fib = Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
filtered = fib |> Stream.filter(&(rem(&1, 2) == 0)) |> Stream.take_while(&(&1 < 4000000))
sum = Enum.reduce(filtered, 0, fn(x, s) -> x + s end)
IO.puts(sum)
