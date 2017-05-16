defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def keep(list, fun) ,do: _verify(list,fun,true)

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: ((any) -> boolean)) :: list(any)
  def discard(list, fun) ,do: _verify(list,fun,false)
  
  defp _verify([],_,_) ,do: []
  defp _verify([h|t],fun,bool) do 
    if apply(fun,[h])==bool do
      [h] ++ _verify(t,fun,bool) 
    else
      _verify(t,fun,bool) 
    end
  end
end

