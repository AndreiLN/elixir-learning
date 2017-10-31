defmodule PascalsTriangle do
  @doc """
  Calculates the rows of a pascal triangle
  with the given height
  """
  @spec rows(integer) :: [[integer]]
  def rows(num),do: get_rows(num)
  
  defp get_rows(num,start \\ 0),do: if start < num ,do: [get_row(start)|get_rows(num,start + 1)] ,else: []

  defp get_row(end_value \\ 0, start_value \\ 0) do
    if start_value <= end_value do
      [round(factorial(end_value)/(factorial(start_value)*factorial(end_value - start_value)))|get_row(end_value,start_value + 1)]
    else 
      []
    end
  end
  
  defp factorial(0), do: 1
  defp factorial(n) when n > 0 ,do: n * factorial(n - 1)
end
