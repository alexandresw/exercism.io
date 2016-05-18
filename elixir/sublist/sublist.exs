defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    result = cond do
      a === b -> :equal
      true -> _compare(a, b, :sublist)
    end

    cond do
      result == :unequal -> _compare(b, a, :superlist)
      true -> result
    end
  end

  defp _compare(_, [], _), do: :unequal
  defp _compare(a, b=[_|t], type) do
    la = length(a)
    lb = length(b)
    cond do
      la > lb -> :unequal
      a === Enum.take(b, length(a)) -> type
      true -> _compare(a, t, type)
    end
  end

end
