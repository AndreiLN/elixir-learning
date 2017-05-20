defmodule AllYourBase do
  @doc """
  Given a number in base a, represented as a sequence of digits, converts it to base b,
  or returns nil if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: list
  def convert(digits, base_a, base_b) when base_a<2 or base_b<2 ,do: nil
  def convert([],_,_),do: nil
  def convert(digits, base_a, base_b) do 
    if (Enum.reject(digits,fn(x)-> x<base_a && x>=0  end) |> length) === 0 ,do: _process(digits,base_a) |> _get_result(base_b)
  end
  
  defp _pow(n, k, acc \\1)
  defp _pow(_, 0, acc), do: acc
  defp _pow(n, k, acc), do: _pow(n, k - 1, n * acc)
  
  defp _process([],base),do: 0
  defp _process([h|t],base),do: h*_pow(base,length(t)) + _process(t,base)
  defp _get_result(number_10,base),do: Integer.digits(number_10,base)
end
