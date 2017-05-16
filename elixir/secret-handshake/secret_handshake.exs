defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    l = []
    dig = Integer.digits(code,2)
    l = l ++ if Enum.at(dig,-1,0)==1, do: ["wink"] ,else: []
    l = l ++ if Enum.at(dig,-2,0)==1, do: ["double blink"] ,else: []
    l = l ++ if Enum.at(dig,-3,0)==1, do: ["close your eyes"] ,else: []
    l = l ++ if Enum.at(dig,-4,0)==1, do: ["jump"] ,else: []
    l = if Enum.at(dig,-5,0)==1, do: Enum.reverse(l), else: l
    l
  end
end

