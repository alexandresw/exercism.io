defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    _check_brackets(String.codepoints(str), [:end, []])
  end

  defp _check_brackets([], [:end|_]), do: true
  defp _check_brackets([], _), do: false

  defp _check_brackets([h|t], stack=[sh|st]) do
    brackets = %{"{": "}", "(": ")", "[": "]" }

    cond do
      String.match?(h, ~r/[\[\{\(]/ ) -> _check_brackets(t, [h] ++ stack)
      is_binary(sh) && brackets[String.to_atom(sh)] == h  -> _check_brackets(t, st)
      String.match?(h, ~r/[\]\}\)]/ ) -> false
      true -> _check_brackets(t, stack)
    end
  end
end
