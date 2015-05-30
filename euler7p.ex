import :math
import Stream

defmodule Primes do 
    def naturals, do: iterate(2, &(&1+1))

    def upto(list, x) do
        list |> take_while(&(&1 <= x))
    end

    def does_not_divide(divisors, x) do
        divisors |> map(&(rem(x, &1) != 0)) |> Enum.all?
    end

    def primes do 
        naturals |> filter(fn current -> naturals |> upto(sqrt(current)) 
                                                  |> does_not_divide(current) 
                                                end)
    end 

    def primes2 do 
        transform(naturals, [], 
            fn current, primes_so_far -> 
                if (primes_so_far |> upto(sqrt(current)) |> does_not_divide(current)) do
                    {[current], primes_so_far ++ [current]} # this is where primes_so_far is copied
                        else
                    {[], primes_so_far}
                        end
                end)
    end
end 

Primes.primes |> Primes.upto(2000000) |> Enum.sum |> IO.puts
