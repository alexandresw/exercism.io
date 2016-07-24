defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t
  def verse(number) do
    """
    #{String.capitalize(bottles(number-1))} of beer on the wall, #{bottles(number-1)} of beer.
    #{second_part(number-1)}, #{bottles(number-2)} of beer on the wall.
    """ 
  end

  defp bottles(integer) do
    case integer do
      0 -> "no more bottles"
      1 -> "1 bottle"
     -1 -> "99 bottles"
      _ -> "#{integer} bottles"
    end
  end

  defp second_part(integer) do
    case integer do
      0 -> "Go to the store and buy some more"
      1 -> "Take it down and pass it around"
      _ -> "Take one down and pass it around"
    end
  end


  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t) :: String.t
  def lyrics(range) do
    range
    |> Enum.map(fn(x) -> verse(x) <> (if x == 1 do "" else "\n" end) end)
    |> List.to_string
  end

  def lyrics() do
    lyrics(100..1)
  end
end
