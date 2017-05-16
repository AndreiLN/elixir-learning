defmodule SumOfMultiples do
  @doc """
  Adds up all numbers from 1 to a given end number that are multiples of the factors provided.
  """
  @spec to(non_neg_integer, [non_neg_integer]) :: non_neg_integer
  def to(limit, factors) do
    Enum.to_list(1..limit-1)
    |> Enum.map(fn x -> verify_multiple(x,factors) end)
    |> Enum.uniq
    |> Enum.reduce(fn (x,acc) -> x + acc end)
  end
  
  defp verify_multiple(num,list,acc \\ 0)
  defp verify_multiple(_,[],acc), do: acc
  defp verify_multiple(num,[h|t],acc) do
    case rem(num,h) do
      0 -> num
      _ -> verify_multiple(num,t,acc) 
    end
  end
end
