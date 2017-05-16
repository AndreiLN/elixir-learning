defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @translate_table %{'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U'}
  @spec to_rna([char]) :: [char]
  def to_rna([]) ,do: ''
  def to_rna([h|t]) ,do: Map.get(@translate_table,[h]) ++ to_rna(t)
end
