defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  use Bitwise

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    result = []
    if (code &&& 0b1) == 0b1, do: result = result ++ ["wink"]
    if (code &&& 0b10) == 0b10, do: result = result ++ ["double blink"]
    if (code &&& 0b100) == 0b100, do: result = result ++ ["close your eyes"]
    if (code &&& 0b1000) == 0b1000, do: result = result ++ ["jump"]
    if (code &&& 0b10000) == 0b10000, do: result = Enum.reverse(result)
    result
  end
end

