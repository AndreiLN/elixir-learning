defmodule Grains do
  @doc """
  Calculate two to the power of the input minus one.
  """
  @spec square(pos_integer) :: pos_integer
  def square(number) when number >= 1 and number <=64 do
    { :ok, Stream.iterate(1, &(&1*2)) |> Enum.at(number-1) }
  end
  def square(_),do: { :error, "The requested square must be between 1 and 64 (inclusive)" }

  @doc """
  Adds square of each number from 1 to 64.
  """
  @spec total :: pos_integer
  def total ,do: { :ok, Stream.iterate(1, &(&1*2)) |> Enum.take(64) |> Enum.sum }
end
