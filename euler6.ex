import Enum


sumOfSquares = 1..100 |> reduce(0, fn x, acc -> (x*x) + acc end) 
sum  = 1..100 |> reduce(0, fn x, acc -> x + acc end) 
IO.puts((sum * sum) - sumOfSquares)