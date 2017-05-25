defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t) :: non_neg_integer
  def to_decimal(string) do
    if Regex.match?(~r/^[01]+$/,string),do: _convert(String.split(string,"",trim: true)) ,else: 0
  end
  
  defp _convert([]),do: 0
  defp _convert([h|t]) do
    String.to_integer(h) *_pow(2,length(t)) + _convert(t) 
  end
  
  defp _pow(n, k, acc \\1)
  defp _pow(_, 0, acc), do: acc
  defp _pow(n, k, acc), do: _pow(n, k - 1, n * acc)
end
