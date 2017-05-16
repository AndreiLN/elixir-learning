defmodule StringSeries do
  @doc """
  Given a string `s` and a positive integer `size`, return all substrings
  of that size. If `size` is greater than the length of `s`, or less than 1,
  return an empty list.
  """
  @spec slices(s :: String.t(), size :: integer) :: list(String.t())
  def slices(s, size, i \\ 0) do
    cond do
    size > String.length(s) || size <= 0 -> []
    i+size < String.length(s) -> [String.slice(s,i,size)|slices(s,size,i+1)]
    true -> [String.slice(s,i,size)]
    end
  end
end

