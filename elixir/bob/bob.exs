defmodule Bob do
  def hey(input) do
    cond do
      Regex.match?(~r/((\d[,;\s]+){2,})*[A-Z]{2,}|[^\x00-\x7F]+/, input) -> "Whoa, chill out!"
      Regex.match?(~r/\?$/, input) -> "Sure."
      Regex.match?(~r/^\s*$/, input) -> "Fine. Be that way!"
      true -> "Whatever."
    end
  end
end
