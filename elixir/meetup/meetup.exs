defmodule Meetup do
  @moduledoc """
  Calculate meetup dates.
  """

  @type weekday ::
      :monday | :tuesday | :wednesday
    | :thursday | :friday | :saturday | :sunday

  @type schedule :: :first | :second | :third | :fourth | :last | :teenth

  @doc """
  Calculate a meetup date.

  The schedule is in which week (1..4, last or "teenth") the meetup date should
  fall.
  """
  @weekday_number %{monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6, sunday: 7}
  
  @spec meetup(pos_integer, pos_integer, weekday, schedule) :: :calendar.date
  def meetup(year, month, weekday, :first),do: _first({year, month, 1}, weekday)
  def meetup(year, month, weekday, :second),do: _first({year, month, 1}, weekday) |> advance_date_by_weeks(1)
  def meetup(year, month, weekday, :third),do: _first({year, month, 1}, weekday) |> advance_date_by_weeks(2)
  def meetup(year, month, weekday, :fourth),do: _first({year, month, 1}, weekday) |> advance_date_by_weeks(3)
  def meetup(year, month, weekday, :last),do: _first({year, month, :calendar.last_day_of_the_month(year, month) - 6}, weekday)
  def meetup(year, month, weekday, :teenth),do: _first({year, month, 13}, weekday)

  defp advance_date_by_weeks({year, month, day}, weeks),do: {year, month, day + weeks * 7}
  defp _first(date, weekday) do
    from_weekday   = Map.get(@weekday_number,weekday)
    to_weekday     = :calendar.day_of_the_week(date)
    offset_in_days = rem(7 - (to_weekday - from_weekday), 7)
    case offset_in_days do
      0 -> date
      _ -> date |> date_to_seconds |> advance(offset_in_days) |> seconds_to_date
    end
  end

  @day_seconds 24 * 60 * 60
  defp advance(seconds, days),do: seconds + days * @day_seconds
  defp date_to_seconds(date),do: :calendar.datetime_to_gregorian_seconds({date, {0, 0, 0}})
  defp seconds_to_date(seconds) do
    {date, _} = :calendar.gregorian_seconds_to_datetime(seconds)
    date
  end
end
