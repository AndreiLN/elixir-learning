defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    _verify(base, candidates)
  end
  
  defp _verify(base, candidates, actual \\ [])
  defp _verify(_, [], actual), do: actual
  defp _verify(base, [h|t], actual) do
    if _same?(base, h) ,do: _verify(base, t, actual ++ [h]) ,else: _verify(base, t, actual)
  end
  
  defp _same?(base, comp) do
    cond do
    String.downcase(base) == String.downcase(comp) -> false
    String.downcase(base) |> String.graphemes |> Enum.sort |> Enum.join("") ==  String.downcase(comp) |> String.graphemes |> Enum.sort |> Enum.join("") -> true
    true -> false
    end
  end
end
