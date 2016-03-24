defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l) do
     _count(l)
  end
  defp _count([]), do: 0
  defp _count([_h|t]), do: 1 + _count(t)

  @spec reverse(list) :: list
  def reverse(l) do
    _reverse(l)
  end

  defp _reverse([]), do: []
  defp _reverse([h|t]), do: _reverse(t) ++ [h]

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
     _map(l, f)
  end

  defp _map([], _f), do: []
  defp _map([h|t], f), do: [f.(h) | _map(t, f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
     _filter(l, f)
  end

  defp _filter([], _f), do: []
  defp _filter([h|t], f) do
     cond do
        f.(h) -> [h | _filter(t, f)]
        true -> _filter(t, f)
     end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do
     _reduce(l, acc, f)
  end

  defp _reduce([], acc, _f), do: acc
  defp _reduce([h|t], acc, f), do: _reduce(t, f.(h, acc), f)

  @spec append(list, list) :: list
  def append(a, b) do
   a ++ b
  end

  defp _append(a, []), do: a
  defp _append(a, [h|t]), do: _append(a ++ [h], t)

  @spec concat([[any]]) :: [any]
  def concat(ll) do
     _concat(ll)
  end

  defp _concat([]), do: []
  defp _concat([h|t]), do: h ++ _concat(t)


end
