defmodule Garden do
  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """
  @plants %{"V" => :violets, "C" => :clover, "R" => :radishes, "G" => :grass}
  @default_student_names [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry]
  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @default_student_names) do
    _get_all(info_string,Enum.sort(student_names))
  end
  defp _get_all(info,students,map \\ %{})
  defp _get_all(_,[],map),do: map
  defp _get_all(info,[name|t],map) do
    _get_all(info,t,Map.put(map,name,_get_plant(String.split(info,"\n"),map |> Map.to_list |> length)))
  end
  defp _get_plant([line1,line2],student \\ 0) do
    plants = (line1 |> String.slice(student+student..student+student+1)) <> (line2 |> String.slice(student+student..student+student+1))
    if String.length(plants)==4 do
      {Map.get(@plants,String.at(plants,0)),Map.get(@plants,String.at(plants,1)),Map.get(@plants,String.at(plants,2)),Map.get(@plants,String.at(plants,3))}
    else 
      {}
    end
  end
end
