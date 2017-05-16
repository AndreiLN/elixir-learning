defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    Regex.split(~r{\s},phrase)
    |> Enum.map_join(" ",&PigLatin._tr/1)
  end
  
  def _tr(word) do
    rgx = ~r/^((b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|x|w|y|z)qu|sch|thr|ch|qu|e(b|c|d|f|g|h|j|k|l|m|n|p|q(?!u)|r|s|t|v|x|w|y|z)|th|(b|c|d|f|g|h|j|k|l|m|n|p|q|r|s|t|v|x(?!r)|w|y(?!t)|z))/
    Regex.replace(rgx,word,"") <> (if length(Regex.scan(rgx,word)) > 0 ,do: Regex.scan(rgx,word) |> List.flatten |> Enum.at(0) ,else: "") <> "ay"
  end
end

