defmodule DNA do
  @map_dna %{?G => ?C, ?C => ?G, ?T => ?A, ?A => ?U}

  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> DNA.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    _process(dna, [])
  end

  defp _process([], result), do: result
  defp _process([h|t], result) do
    _process(t, result ++ [@map_dna[h]] )
  end
end
