defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    _match(base, candidates, [])
  end

  defp _match(_, [], result), do: result
  defp _match(base, [h|t], result) do
    result = cond do
      is_anagram?(base, h) -> result ++ [h]
      true -> result
    end
    _match(base, t, result)
  end

  def is_anagram?(base, candidate) do
    base = String.downcase base
    candidate = String.downcase candidate

    if base == candidate do
      false
    else
      base = base |> String.codepoints |> Enum.sort
      candidate = candidate |> String.codepoints |> Enum.sort
      base == candidate
    end
  end

end
