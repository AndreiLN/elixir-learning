defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """
  @lookup ["1000": "M", "900": "CM", "500": "D", "400": "CD", "100": "C", "90": "XC", "50": "L", "40": "XL", "10": "X", "9": "IX", "5": "V", "4": "IV", "1": "I"]
  @spec numerals(pos_integer) :: String.t
  def numerals(number) do
    _do_lookup(@lookup,number)
  end
  
  defp _do_lookup([],_),do: ""             
  defp _do_lookup([{k,v}|t],number),do: "#{_make_str(k,v,number)}#{_do_lookup(t,_get_amount(k,number))}"
  defp _make_str(k,v,number),do: if number >= _atom_to_int(k) ,do: "#{v}#{_make_str(k,v,number-_atom_to_int(k))}" ,else: ""
  defp _get_amount(k,number),do: if number >= _atom_to_int(k) ,do: _get_amount(k,number-_atom_to_int(k)) ,else: number
  defp _atom_to_int(at),do: at |> Atom.to_string |> String.to_integer
end
