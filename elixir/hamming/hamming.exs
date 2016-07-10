defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance([], []), do: {:ok, 0}
  def hamming_distance(_, []), do: {:error, "Lists must be the same length."}
  def hamming_distance([], _), do: {:error, "Lists must be the same length."}
  def hamming_distance([h1|t1], [h2|t2]) do
    case hamming_distance(t1, t2) do
      {:ok, count} -> {:ok, count + (if h1 != h2 do 1 else 0 end) }
      error -> error
    end
  end
end
