import Dict
import Enum

defmodule Anagram do

	def key(word), do: word |> String.codepoints |> Enum.sort

end

{:ok, fileData} = File.read "wordlist.txt"

words = String.split(fileData) 

map = words |> reduce(HashDict.new, fn word, map -> 
										key = Anagram.key(word)
										has_key?(map, key) && put(map, key, [word] ++ get(map, key)) || put(map, key, [])
									end)

get(map, Anagram.key("pictures")) |> IO.inspect


