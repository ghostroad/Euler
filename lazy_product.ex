defmodule LazyProduct do
	def square(list) do
		Stream.transform(list, 0, fn elem, ordinal -> 
									pairs = Stream.concat([{elem, elem}], (list |> Stream.take(ordinal) |> Stream.flat_map(&([{elem, &1}, {&1, elem}]))))
									{pairs, ordinal + 1}
								  end
			)
	end
end

LazyProduct.square([1, 3, 4, 6]) |> Enum.take(30) |> IO.inspect