defmodule Bob do
  def hey(input) do
    input = Regex.replace(~r/([0-9]{1,})|([\s]{1,})/,input,"")
    cond do
        Regex.match?(~r{\?$},input) -> "Sure."
        input == "" -> "Fine. Be that way!"
        input == String.upcase(input) && Regex.match?(~r/[\w]{1,}/,input) -> "Whoa, chill out!"
        true -> "Whatever."
    end
  end
end
