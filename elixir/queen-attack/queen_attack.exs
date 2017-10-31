defmodule Queens do
  @type t :: %Queens{ black: {integer, integer}, white: {integer, integer} }
  defstruct black: nil, white: nil

  @doc """
  Creates a new set of Queens
  """
  @spec new() :: Queens.t()
  @spec new({integer, integer}, {integer, integer}) :: Queens.t()
  def new({white_x,white_y} \\ {0,3} , {black_x,black_y} \\ {7,3}) do
    if {white_x,white_y} == {black_x,black_y}, do: raise ArgumentError, message: "Cannot occupy same space" 
    %Queens{ black: {black_x, black_y}, white: {white_x, white_y}}
  end

  @doc """
  Gives a string reprentation of the board with
  white and black queen locations shown
  """
  @spec to_string(Queens.t()) :: String.t()
  def to_string(queens),do: _fill_string(queens)
  
  defp _fill_string(queens, x \\ 0, y \\ 0) do
    cond do
      x < 7 -> "#{_get_symbol(Map.get(queens,:white),Map.get(queens,:black),x,y)} #{_fill_string(queens, x+1, y)}"
      x == 7 -> "#{_get_symbol(Map.get(queens,:white),Map.get(queens,:black),x,y)}#{_fill_string(queens, x+1, y)}"
      y < 7 -> "\n#{_fill_string(queens, 0, y+1)}"
      true -> ""
    end
  end 
  
  defp _get_symbol({white_y, white_x}, {black_y, black_x}, x \\ 0, y \\ 0) do
    cond do
      white_x == x && white_y == y -> "W"
      black_x == x && black_y == y -> "B"
      true -> "_"
    end
  end

  @doc """
  Checks if the queens can attack each other
  """
  @spec can_attack?(Queens.t()) :: boolean
  def can_attack?(queens) do
   {white_y, white_x} = Map.get(queens,:white)
   {black_y, black_x} =Map.get(queens,:black)
   cond do 
    white_y == black_y -> true
    white_x == black_x -> true
    white_y - black_y == white_x - black_x -> true
    white_x == black_y && black_x == white_y -> true 
    true -> false
   end
  end
end
