defmodule Luhn do
  @doc """
  Calculates the total checksum of a number
  """
  @spec checksum(String.t()) :: integer
  def checksum(number) do
    String.trim(number)
    |> String.split("",trim: true)
    |> Enum.reverse
    |> Enum.with_index
    |> Enum.reduce(0,fn (x,acc) -> 
      {v,k} = x
      acc = acc + if rem(k,2)!=0 do
        n = String.to_integer(v) * 2
        n = if n > 9 ,do: n - 9 ,else: n
      else
        String.to_integer(v)
      end
    end)
  end

  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(number),do: rem(checksum(number),10)==0

  @doc """
  Creates a valid number by adding the correct
  checksum digit to the end of the number
  """
  @spec create(String.t()) :: String.t()
  def create(number) do
    _test(number)
  end
  
  defp _test(number,actual \\ "0") do
    if valid?(number <> actual) do
      number <> actual
    else
      _test(number,String.to_integer(actual) + 1 |> Integer.to_string)
    end
  end
end
