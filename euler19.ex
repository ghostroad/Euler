import Stream

defmodule Euler19 do

	defp isLeapYear(year) do
		(rem(year, 400) == 0) or (rem(year, 100) != 0 and rem(year, 4) == 0)
	end

	defp daysOfWeek, do: ["M", "T", "W", "Th", "F", "Sa", "Su"]

	defp numDays(2, year) do
		isLeapYear(year) && 29 || 28
	end

	defp numDays(month, _year) when month in [4, 6, 9, 11],  do: 30

	defp numDays(month, _year) when month in [1, 3, 5, 7, 8, 10, 12],  do: 31

	defp nextDate({month, day, year}) do
		cond do
			day < numDays(month, year) -> {month, day + 1, year}
			month < 12 -> {month + 1, 1, year}
			true -> {1, 1, year + 1}
		end
	end

	def dates do
		iterate({1, 1, 1900}, &nextDate/1) |> zip(cycle(daysOfWeek))
	end

	def year({{_, _, y}, _}), do: y

end

Euler19.dates 
|> drop_while(&(Euler19.year(&1) < 1901)) 
|> take_while(&(Euler19.year(&1) <= 2000))
|> filter(fn {{_, day, _}, weekday} -> day == 1 && weekday == "Su" end)
|> Enum.count
|> IO.puts
