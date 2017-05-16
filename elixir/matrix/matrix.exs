defmodule Matrix do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    %Matrix{matrix: String.split(input,"\n")
      |> Enum.map(fn x ->
        String.split(x," ")
        |> Enum.map(fn y -> String.to_integer(y) end)
      end)
    }
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    Map.get(matrix, :matrix)
    |> Enum.map(fn x -> Enum.join(x," ") end)
    |> Enum.join("\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix) do
    Map.get(matrix, :matrix)
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    Map.get(matrix, :matrix)
    |> Enum.at(index)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    Map.get(matrix, :matrix)
    |> _get_rows()
  end
  
  defp _get_rows(list,row_idx \\ 0, col_idx \\ 0) do
    if _get(list,0,col_idx) != nil,do: [_get_col(list,row_idx,col_idx)] ++ _get_rows(list,0,col_idx + 1) ,else: []
  end
  
  defp _get_col(list,row_idx,fixed_col_idx) do
    if Enum.at(list,row_idx) != nil ,do: [_get(list,row_idx,fixed_col_idx)|_get_col(list,row_idx + 1,fixed_col_idx)] ,else: []
  end
  
  defp _get(list,row_idx,col_idx), do: list |> Enum.at(row_idx) |> Enum.at(col_idx)
  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    columns(matrix)
    |> Enum.at(index)
  end
end

