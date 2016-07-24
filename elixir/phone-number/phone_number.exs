defmodule Phone do
  @invalid "0000000000"
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    result = [h|t] = raw
    |> String.graphemes
    |> Enum.filter(&(String.match? &1, ~r/\d/))

    cond do
      String.match?(raw, ~r/[a-z]/) -> @invalid
      Enum.count(result) == 10 -> List.to_string result
      Enum.count(result) == 11 && h == "1" -> List.to_string t
      true -> @invalid
    end
  end

  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    result = number(raw)
    cond do
      String.length(result) == 10 -> String.slice(result, 0..2)
      true -> "000"
    end
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    result = number(raw)
    cond do
      String.length(result) == 10 -> "(#{String.slice(result, 0..2)}) #{String.slice(result, 3..5)}-#{String.slice(result, 6..9)}"
      true -> "(000) 000-0000"
    end
  end

end
