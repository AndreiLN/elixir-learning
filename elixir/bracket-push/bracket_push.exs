defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    String.codepoints(str)
    |> check?
  end
  
  defp check?(list, stack \\ [])
  defp check?([], []), do: true
  defp check?([], _),  do: false
  defp check?([h|t], stack) when h in ["(", "[", "{"], do: check?(t, [h|stack])
  defp check?([")"|t], ["("|stack]), do: check?(t, stack)
  defp check?(["]"|t], ["["|stack]), do: check?(t, stack)
  defp check?(["}"|t], ["{"|stack]), do: check?(t, stack)
  defp check?([h|_], _) when h in [")", "]", "}"], do: false
  defp check?([_|t], stack), do: check?(t, stack)
end
