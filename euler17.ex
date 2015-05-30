defmodule Euler17 do
	
	def words(n) when n in 1..19 do
		{"one", "two", "three", "four", "five", 
		"six", "seven", "eight", "nine", "ten",
		"eleven", "twelve", "thirteen", "fourteen", 
		"fifteen", "sixteen", "seventeen", "eighteen", "nineteen"} |> elem(n - 1)
	end

	def words(n) when n in 20..99 do
		({"twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"}
		|> elem(div(n, 10) - 2)) <> 
		(if (rem(n, 10) == 0), do: "", else: "-" <> words(rem(n, 10)))
	end

	def words(n) when n in 100..999 do
		words(div(n, 100)) <> " hundred" <> 
		(if (rem(n, 100) == 0), do: "", else: " and " <> words(rem(n, 100)))
	end

	def words(1000), do: "one thousand"

	def countLetters(str) do
		Regex.scan(~r/\w/, str) |> Enum.count
	end


end

1..1000 |> Enum.reduce(0, fn s, acc -> Euler17.countLetters(Euler17.words(s)) + acc end) |> IO.puts

