defmodule RotationalCipher do
  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> String.codepoints
    |> rotate(shift, "")
  end

  defp rotate([], shift, result), do: result

  defp rotate([<<h::utf8>>|t], shift, result) do
    cond do
      h >= ?a && h <= ?z -> result = result <> <<rem(h+shift-?a, 26)+?a :: utf8>>
      h >= ?A && h <= ?Z -> result = result <> <<rem(h+shift-?A, 26)+?A :: utf8>>
      true -> result = result <> <<h::utf8>>
    end
    rotate(t, shift, result)
  end
end

