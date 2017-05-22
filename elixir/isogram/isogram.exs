defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence = String.downcase(sentence) |> String.replace(~r/[^a-z]/,"")
    sentence |> String.graphemes |> Enum.uniq |> length == String.length(sentence)
  end

end
