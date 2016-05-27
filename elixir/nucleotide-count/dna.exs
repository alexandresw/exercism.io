defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]
  @initial_map %{?A => 0, ?T => 0, ?C => 0, ?G => 0}

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    _check(nucleotide)
    _process(strand, @initial_map)[nucleotide]
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    _process strand, @initial_map
  end

  defp _process([], map), do: map
  defp _process([h|t], map) do
    _check(h)
    _process t, Map.update!(map, h, &(&1 + 1))
  end

  defp _check(char) do
    unless Enum.member?(@nucleotides, char), do: raise ArgumentError
  end

end
