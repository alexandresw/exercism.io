defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
     sentence
     |> String.downcase()
     |> String.replace(~r/[^\d\s\-_a-z\pLu]/u, "")
     |> String.replace(~r/\s{2,}/, " ")
     |> String.split([" ", "_"])
     |> Enum.group_by(&(&1))
     |> Map.values()
     |> Map.new(fn([x|y]) -> {x, Enum.count(y)+1 } end)
  end
end
