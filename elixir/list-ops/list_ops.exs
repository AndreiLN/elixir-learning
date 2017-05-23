defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(list, len \\ 0)
  def count([], len),do: len
  def count([_|t], len),do: count(t,len+1)

  @spec reverse(list) :: list
  def reverse([]),do: []
  def reverse(l) do
    {last,l} = List.pop_at(l,length(l)-1)
    [last|reverse(l)]
  end

  @spec map(list, (any -> any)) :: list
  def map([], _),do: []
  def map([h|t], f),do: [f.(h)|map(t,f)]

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _),do: []
  def filter([h|t], f) do
    case f.(h) do
      true -> [h|filter(t,f)]
      _ -> filter(t,f)
    end
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _),do: acc
  def reduce([h|t], acc, f),do: reduce(t,f.(h,acc),f)

  @spec append(list, list) :: list
  def append(a, b),do: _append(reverse(a), b)
  defp _append([], b), do: b
  defp _append([h|t], b), do: _append(t, [h|b])

  @spec concat([[any]]) :: [any]
  def concat(list1, list_temp \\ [])
  def concat([],list_temp),do: list_temp
  def concat([h|t],list_temp),do: concat(t,append(list_temp,h))
end
