defmodule Prime do

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(count) when count < 1 ,do: raise "Invalid number"
  def nth(count) do
    Stream.filter_map(1..10_000_000, fn n -> _only_primes(n)!= nil end, fn n -> _only_primes(n) end) |> Enum.take(count) |> List.last
  end

  defp _only_primes(number), do: if _by_2(number)<2 && _by_2(number)!=0 ,do: number
  defp _by_2(number), do: if rem(number,2)==0 ,do: 1 + _by_odds(number,3) ,else: _by_odds(number,3)
  defp _by_odds(number, div) when div <= number do
    cond do
      rem(number, div) == 0 -> 1 + _by_odds(number, div + 1)
      true -> _by_odds(number, div + 1)
    end
  end
  defp _by_odds(number, acc \\0) ,do: 0
end
