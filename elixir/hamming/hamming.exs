defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    cond do
      length(strand1) != length(strand2) -> {:error, "Lists must be the same length"}
      true -> {:ok, get_len(strand1,strand2)}
    end
  end
  defp get_len(strand1,strand2,length \\ 0)
  defp get_len([],_,length),do: length
  defp get_len([h1|t1],[h2|t2],length) do
    cond do
      h1==h2 -> get_len(t1,t2,length)
      true -> get_len(t1,t2,length+1) 
    end
  end
end
