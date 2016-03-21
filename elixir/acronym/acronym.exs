defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
   string
   |> String.replace(~r/\w([A-Z])/, " \\g{1}")
   |> String.split(~r/[^\w]/, trim: true)
   |> Enum.reduce("", fn(word, acronym) -> "#{acronym}#{String.first(word)}" end )
   |> String.upcase
  end
end
