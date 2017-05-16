defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    shift = if div(shift,26)==0 ,do: shift ,else: shift - (div(shift,26) * 26)
    String.to_charlist(text)
    |> Enum.map(fn(x) -> 
      if ((x>=?a)&&(x<=?z)), do: rot(x,shift,?z) ,else: if ((x>=?A)&&(x<=?Z)), do: rot(x,shift,?Z), else: x
    end)
    |> List.to_string
  end
  
  defp rot(letter,shift,limit) do
    if (letter+shift)>limit do
      shift = shift - if letter>limit, do: (letter - limit) ,else: (limit - letter)
      letter = (limit-26) + shift
    else
      letter = letter + shift
    end
    letter
  end
end

