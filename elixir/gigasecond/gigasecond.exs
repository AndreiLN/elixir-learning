defmodule Gigasecond do
  @doc """
  Calculate a date one billion seconds after an input date.
  """
  @spec from({{pos_integer, pos_integer, pos_integer}, {pos_integer, pos_integer, pos_integer}}) :: :calendar.datetime

  def from({{year, month, day}, {hours, minutes, seconds}}) do
    {_, dt} = NaiveDateTime.new(year,month,day,hours,minutes,seconds)
    NaiveDateTime.add(dt,1_000_000_000)
    |> NaiveDateTime.to_erl
  end
end
