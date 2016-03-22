defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
     String.codepoints(string)
     |> process_encode
  end

  def process_encode([]), do: ""
  def process_encode([], count, letter), do: "#{count}#{letter}"
  def process_encode([first|tail], count \\ 0, letter \\ nil) do
     cond do
        !letter || first == letter -> process_encode(tail, count+1, first)
        true -> "#{count}#{letter}" <> process_encode(tail, 1, first)
     end
  end


  @spec decode(String.t) :: String.t
  def decode(string) do
     Regex.scan(  ~r/(\d+[A-Z])/, string, capture: :first )
     |> process_decode
  end

  def process_decode([]), do: ""
  def process_decode([[first]|tail]) do
     letter = String.last(first)
     {quantity, _} = Integer.parse(first)
     "#{String.duplicate(letter, quantity)}" <> process_decode(tail)
  end

end
