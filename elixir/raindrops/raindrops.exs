defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @sound %{3 => "Pling", 5 => "Plang", 7 => "Plong"}
  
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    if _cvt(number) != "", do: _cvt(number) ,else: "#{number}"
  end
  
  defp _cvt(number,factor \\3)
  defp _cvt(_,factor) when factor > 7 ,do: ""
  defp _cvt(number,factor), do: if(rem(number,factor) == 0 ,do: "#{Map.get(@sound,factor)}#{_cvt(number,factor+2)}" ,else: "#{_cvt(number,factor+2)}")
end
