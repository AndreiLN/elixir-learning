defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    Regex.split(~r/([\s]{1,}|_)/,Regex.replace(~r/(\!|&|@|\$|%|\^|&|:|,|\.|;)/,sentence,""))
    |> Enum.reduce(%{},fn (x,acc) -> Map.update(acc, String.downcase(x), 1, &(&1 + 1)) end)
  end
end
