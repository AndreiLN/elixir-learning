defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string = Regex.replace(~r/([A-Z])/, string, fn _, x -> " #{x}" end)
    Regex.replace(~r/(\s[\w])/, string, fn _,x -> "#{String.upcase(x)}" end)
    |> String.trim
    |> String.split(~r/[^\w]{1,}/)
    |> Enum.map(fn l -> Regex.scan(~r/[A-Z]/,l) |> List.flatten |> List.to_string |> String.upcase end)
    |> Enum.join
  end
end
