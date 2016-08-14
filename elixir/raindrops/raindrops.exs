defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
      case result = check(number, 3) <> check(number, 5) <> check(number, 7) do
      "" -> Integer.to_string(number)
      _  -> result
    end
  end

  defp check(number, factor) when rem(number, factor) == 0 do
    cond do
      factor == 3 -> "Pling"
      factor == 5 -> "Plang"
      factor == 7 -> "Plong"
    end
  end
  defp check(_, _), do: ""
end
