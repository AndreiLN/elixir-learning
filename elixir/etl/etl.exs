defmodule ETL do
  @doc """
  Transform an index into an inverted index.

  ## Examples

  iex> ETL.transform(%{"a" => ["ABILITY", "AARDVARK"], "b" => ["BALLAST", "BEAUTY"]})
  %{"ability" => "a", "aardvark" => "a", "ballast" => "b", "beauty" =>"b"}
  """
  @spec transform(map) :: map
  def transform(input) do
    input
    |> Map.to_list
    |> _build_all
  end
  defp _build_all(list, new_map \\ %{})
  defp _build_all([], new_map),do: new_map 
  defp _build_all([h|t], new_map) do
    {key,values} = h
    new_map = _build_new_map(values,key,new_map)
    _build_all(t,new_map)
  end
  
  defp _build_new_map(values,key,new_map \\ %{})
  defp _build_new_map([],_,new_map),do: new_map
  defp _build_new_map([h|t],key,new_map),do: _build_new_map(t,key,Map.put(new_map,String.downcase(h),key))
end
