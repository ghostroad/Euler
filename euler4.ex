import Enum

defmodule Euler4 do
	def isPalindromic(x) when is_integer(x) do
		to_string(x) |> isPalindromic
	end

	def isPalindromic(x) when is_binary(x) do
		(String.reverse(x) == x)
	end	

	def product([], _list2), do: []
	def product([head | tail], list2) do
		(list2 |> map(&({head, &1}))) ++ product(tail, list2)
	end

end

pairs = Euler4.product(to_list(100..999), to_list(100..999))

largestPalindrome = pairs 
					|> map(fn {x, y} -> x * y end) 
					|> filter(&(Euler4.isPalindromic(&1))) 
					|> max

IO.puts(largestPalindrome)