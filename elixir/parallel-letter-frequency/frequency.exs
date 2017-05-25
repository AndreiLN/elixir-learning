defmodule Frequency do
  @doc """
  Count letter frequency in parallel.

  Returns a map of characters to frequencies.

  The number of worker processes to use can be set with 'workers'.
  """
  @spec frequency([String.t], pos_integer) :: map
  def frequency(words, workers) do
    words
    |> Enum.join
    |> String.downcase
    |> String.replace(~r/[^a-zà-ÿ]/,"")
    |> String.split("",trim: true)
    |> do_chunk(workers)
    |> Enum.map(fn (elem) -> Task.async(fn -> Enum.group_by(elem,&String.first/1) end) end)
    |> Enum.map(fn (task) -> Task.await(task) end)
    |> Enum.reduce(%{},fn (x,acc) -> 
      Enum.reduce(x,acc,fn (y,map) ->
        {k,v} = y
        Map.update(map,k,length(v),&(&1 + length(v)))
      end)
    end)
  end
  defp do_chunk([], _), do: [[]]
  defp do_chunk(list, workers) do
    c = Enum.count(list) / workers |> Float.ceil |> round
    Enum.chunk(list, c, c, [])
  end
end
