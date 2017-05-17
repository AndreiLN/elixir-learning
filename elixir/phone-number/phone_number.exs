defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    verify(raw)
  end
  defp verify(raw) ,do: String.replace(raw,~r/[^0-9a-zA-Z]/,"") |> has_no_letter? 
  defp has_no_letter?(raw) ,do: if String.match?(raw, ~r/[a-zA-Z]/) ,do: String.duplicate("0",10) ,else: valid_length?(raw)
  defp valid_length?(raw) ,do: if String.match?(raw, ~r/^(1[0-9]{10})|^([0-9]{10})$/) ,do: cut(raw) ,else: String.duplicate("0",10)
  defp cut(raw) ,do: if String.length(raw) == 10 ,do: raw ,else: String.replace(raw,~r/^1/,"")
  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    verify(raw)
    |> String.slice(0..2)
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    number = verify(raw)
    "(#{String.slice(number, 0..2)}) #{String.slice(number, 3..5)}-#{String.slice(number, 6..10)}"
  end
end
