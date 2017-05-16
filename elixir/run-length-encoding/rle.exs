defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "AABBBCCCC" => "2A3B4C"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "2A3B4C" => "AABBBCCCC"
  """
  @spec encode(String.t) :: String.t
  def encode("") ,do: ""
  def encode(string) do
   String.graphemes(string)
   |> _count()
  end
  
  defp _get_value(keys,values,idx \\ 0), do: if length(keys) > idx ,do: "#{Enum.at(values,idx)}#{Enum.at(keys,idx)}#{_get_value(keys,values,(idx + 1))}" ,else: ""

  @spec decode(String.t) :: String.t
  def decode(string) do
    String.split(string,~r/[0-9]{0,}[a-zA-Z]{1}/,[include_captures: true, trim: true])
    |> Enum.map(fn x -> 
      l = String.split(x,~r/[0-9]{1,}/,[include_captures: true, trim: true]) 
      if Regex.match?(~r/[0-9]{1,}/,x), do: _repeat(Enum.at(l,1),Enum.at(l,0)|>String.to_integer), else: Enum.at(l,0)
    end)
    |> Enum.join("")
  end
  
  defp _repeat(letter, times, acc \\ 0)
  defp _repeat(_, times, acc) when times == acc ,do: ""
  defp _repeat(letter, times, acc) ,do: "#{letter}#{_repeat(letter,times,acc+1)}"
  
  defp _count(letter,acc \\ 0,last \\ "")
  defp _count([],acc,last) ,do: "#{_verify_acc(acc)}#{last}"
  defp _count([h|t], acc, last) do
    if h != last && last != "" ,do: "#{_verify_acc(acc)}#{last}#{_count(t,1,h)}" ,else: _count(t,acc + 1,h)
  end
  defp _verify_acc(acc), do: if acc == 1 ,do: "" ,else: acc
end
