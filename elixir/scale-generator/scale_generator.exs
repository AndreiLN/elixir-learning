defmodule ScaleGenerator do
  @doc """
  Find the note for a given interval (`step`) in a `scale` after the `tonic`.

  "m": one semitone
  "M": two semitones (full tone)
  "A": augmented second (three semitones)

  Given the `tonic` "D" in the `scale` (C C# D D# E F F# G G# A A# B C), you
  should return the following notes for the given `step`:

  "m": D#
  "M": E
  "A": F
  """
  @seminotes %{"m" => 1, "M" => 2, "A" => 3, "self" => 0}
  @spec step(scale :: list(String.t()), tonic :: String.t(), step :: String.t()) :: list(String.t())
  def step(scale, tonic, step) do
    idx = Enum.find_index(scale,fn x -> x == tonic end)
    Enum.at(scale,idx + @seminotes[step])
  end

  @doc """
  The chromatic scale is a musical scale with thirteen pitches, each a semitone
  (half-tone) above or below another.

  Notes with a sharp (#) are a semitone higher than the note below them, where
  the next letter note is a full tone except in the case of B and E, which have
  no sharps.

  Generate these notes, starting with the given `tonic` and wrapping back
  around to the note before it, ending with the tonic an octave higher than the
  original. If the `tonic` is lowercase, capitalize it.

  "C" should generate: ~w(C C# D D# E F F# G G# A A# B C)
  """
  @chromatic ["A","A#","B","C","C#","D","D#","E","F","F#","G","G#"]
  @spec chromatic_scale(tonic :: String.t()) :: list(String.t())
  def chromatic_scale(tonic \\ "C"),do: _chr_scale(tonic,@chromatic)

  @doc """
  Sharp notes can also be considered the flat (b) note of the tone above them,
  so the notes can also be represented as:

  A Bb B C Db D Eb E F Gb G Ab

  Generate these notes, starting with the given `tonic` and wrapping back
  around to the note before it, ending with the tonic an octave higher than the
  original. If the `tonic` is lowercase, capitalize it.

  "C" should generate: ~w(C Db D Eb E F Gb G Ab A Bb B C)
  """
  @flat_chromatic ["A","Bb","B","C","Db","D","Eb","E","F","Gb","G","Ab"]
  @spec flat_chromatic_scale(tonic :: String.t()) :: list(String.t())
  def flat_chromatic_scale(tonic \\ "C"),do: _chr_scale(tonic,@flat_chromatic)

  @doc """
  Certain scales will require the use of the flat version, depending on the
  `tonic` (key) that begins them, which is C in the above examples.

  For any of the following tonics, use the flat chromatic scale:

  F Bb Eb Ab Db Gb d g c f bb eb

  For all others, use the regular chromatic scale.
  """
  @spec find_chromatic_scale(tonic :: String.t()) :: list(String.t())
  def find_chromatic_scale(tonic) do
    if Regex.match?(~r/^(F|Bb|Eb|Ab|Db|Gb|d|g|c|f|bb|eb)$/,tonic),do: _chr_scale(tonic,@flat_chromatic) ,else: _chr_scale(tonic,@chromatic)
  end

  @doc """
  The `pattern` string will let you know how many steps to make for the next
  note in the scale.

  For example, a C Major scale will receive the pattern "MMmMMMm", which
  indicates you will start with C, make a full step over C# to D, another over
  D# to E, then a semitone, stepping from E to F (again, E has no sharp). You
  can follow the rest of the pattern to get:

  C D E F G A B C
  """
  @spec scale(tonic :: String.t(), pattern :: String.t()) :: list(String.t())
  def scale(tonic, pattern) do
    {_,l} = find_chromatic_scale(tonic) |> List.pop_at(12)
    Stream.cycle(l)
    |> _scale(String.split(pattern,"",trim: true))
  end
  
  defp _scale(stream, pattern, actual_idx \\ 0)
  defp _scale(stream, [], _),do: [Enum.at(stream,0)]
  defp _scale(stream, [h|t], actual_idx) do
    n_idx = case h do
      "m" -> actual_idx + 1
      "M" -> actual_idx + 2
      "A" -> actual_idx + 3
    end
    [Enum.at(stream,actual_idx)|_scale(stream,t,n_idx)]
  end
  
  defp _chr_scale(tonic,scale) do
    stream = Stream.cycle(scale)
    idx = Enum.find_index(stream,fn x-> String.upcase(x) == String.upcase(tonic) end)
    _take(stream,idx)
  end
  defp _take(list, initial_idx),do: _take_l(list,initial_idx,initial_idx+13)
  defp _take_l(list, actual_idx, final_idx) when actual_idx < final_idx ,do: [Enum.at(list,actual_idx)|_take_l(list,actual_idx+1,final_idx)]
  defp _take_l(_,_,_),do: []
end

