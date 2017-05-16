defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b -> :equal
      contains?(a, b) -> :superlist
      contains?(b, a) -> :sublist
      true -> :unequal
    end
  end

  defp contains?(l, sub) do
    count = Enum.count(sub)
    cond do
      count > Enum.count(l) -> false
      Enum.take(l, count) === sub -> true
      true -> [_|t] = l 
        contains?(t, sub)
    end
end
end
