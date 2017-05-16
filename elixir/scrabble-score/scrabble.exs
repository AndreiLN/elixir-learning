defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word = String.upcase(word)
    _get_score(word,~r/[AEIOULNRST]/) + _get_score(word,~r/[DG]/,2) + _get_score(word,~r/[BCMP]/,3) + _get_score(word,~r/[FHVWY]/,4) + _get_score(word,~r/[K]/,5) + _get_score(word,~r/[JX]/,8) + _get_score(word,~r/[QZ]/,10)
  end
  defp _get_score(word,rgx,mult \\ 1), do: (Regex.scan(rgx,word)|>List.flatten|>length) * mult
end