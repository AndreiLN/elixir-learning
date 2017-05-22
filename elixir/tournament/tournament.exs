defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @teams %{}
  @default_team %{matches: 0, wins: 0, draws: 0, losses: 0, points: 0}
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    populate_teams(input)
    |> Enum.sort(fn (team1,team2)-> 
      {t1name,t1res} = team1
      {t2name,t2res} = team2
      t1res[:points] >= t2res[:points]
    end)
    |> print()
    |> String.trim
  end
  defp print(list), do: "Team                           | MP |  W |  D |  L |  P\n#{print_results(list)}"
  defp print_results([]),do: ""
  defp print_results([h|t]) do
    {team_name,team_score} = h
    String.pad_trailing(team_name,31) <> "|  #{team_score[:matches]} |  #{team_score[:wins]} |  #{team_score[:draws]} |  #{team_score[:losses]} |  #{team_score[:points]}\n#{print_results(t)}"
  end
  
  defp populate_teams(list,teams \\ %{})
  defp populate_teams([],teams),do: teams
  defp populate_teams([h|t],teams) do
    if Regex.scan(~r/;/,h) |> List.flatten |> length == 2 do
      team1 = String.split(h,";") |> Enum.at(0)
      team2 = String.split(h,";") |> Enum.at(1)
      result = String.split(h,";") |> Enum.at(2)
      teams = case result do
        "win" -> _put(teams,team1,team2,"win","loss")
        "loss" -> _put(teams,team1,team2,"loss","win")
        "draw" -> _put(teams,team1,team2)
        _ -> teams
      end
    end
    populate_teams(t,teams)
  end
  
  defp _put(teams,team1,team2,result1 \\ "draw",result2 \\ "draw") do
    Map.put(teams,team1,update_team(Map.get(teams, team1, @default_team),result1)) 
    |> Map.put(team2,update_team(Map.get(teams, team2, @default_team),result2))
  end
  defp update_team(team, result) do
    team = team |> Map.put(:matches, Map.get(team, :matches, 0) +1)
    team = case result do
      "win" -> team |> Map.put(:wins, Map.get(team, :wins, 0) +1) |> Map.put(:points, Map.get(team, :points, 0) +3)
      "draw" -> team |> Map.put(:draws, Map.get(team, :draws, 0) +1) |> Map.put(:points, Map.get(team, :points, 0) +1)
      "loss" -> team |> Map.put(:losses, Map.get(team, :losses, 0) +1) 
    end
  end
end

