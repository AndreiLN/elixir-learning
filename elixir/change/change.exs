defmodule Change do
  @doc """
    Determine the least number of coins to be given to the user such
    that the sum of the coins' value would equal the correct amount of change.
    It returns {:error, "cannot change"} if it is not possible to compute the
    right amount of coins. Otherwise returns the tuple {:ok, list_of_coins}

    ## Examples

      iex> Change.generate([5, 10, 15], 3)
      {:error, "cannot change"}

      iex> Change.generate([1, 5, 10], 18)
      {:ok, [1, 1, 1, 5, 10]}

  """

  @spec generate(list, integer) :: {:ok, list} | {:error, String.t}
  def generate(coins, target),do: _all(coins,target) |> Enum.sort |> List.last
  
  defp _all([], _),do: []
  defp _all(coins, target) do 
    {_, n_coins} = List.pop_at(coins,length(coins)-1)
    [_get_coins(Enum.reverse(coins),target)|_all(n_coins,target)]
  end
  
  defp _get_coins(coins,value,list_of_coins \\ [])
  defp _get_coins([],_,_),do: {:error, "cannot change"}
  defp _get_coins(_,0,list_of_coins),do: {:ok, list_of_coins}
  defp _get_coins([h|t],value,list_of_coins) do
    cond do
      value - h == 1 && Enum.find([h|t],0,fn x -> x==1 end) == 0 -> {_, n_coins} = List.pop_at([h|t],0)
                                                               _get_coins(n_coins,value,list_of_coins)
      value >= h -> _get_coins([h|t],value-h,[h|list_of_coins])
      true -> _get_coins(t,value,list_of_coins)
    end
  end
end
