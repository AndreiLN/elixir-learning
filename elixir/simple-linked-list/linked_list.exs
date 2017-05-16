defmodule LinkedList do
  @opaque t :: tuple()

  @doc """
  Construct a new LinkedList
  """
  @spec new() :: t
  def new() do
    {}
  end

  @doc """
  Push an item onto a LinkedList
  """
  @spec push(t, any()) :: t
  def push(list, elem) do
    {elem, list}
  end

  @doc """
  Calculate the length of a LinkedList
  """
  @spec length(t) :: non_neg_integer()
  def length(list, count \\ 0)
  def length({}, count), do: count
  def length({_, list}, count) do
    __MODULE__.length(list, count + 1)
  end

  @doc """
  Determine if a LinkedList is empty
  """
  @spec empty?(t) :: boolean()
  def empty?(list) do
    __MODULE__.length(list) == 0
  end

  @doc """
  Get the value of a head of the LinkedList
  """
  @spec peek(t) :: {:ok, any()} | {:error, :empty_list}
  def peek({}), do: {:error, :empty_list}
  def peek({h,_}), do: {:ok, h}

  @doc """
  Get tail of a LinkedList
  """
  @spec tail(t) :: {:ok, t} | {:error, :empty_list}
  def tail({}), do: {:error, :empty_list}
  def tail({_,t}), do: {:ok, t}

  @doc """
  Remove the head from a LinkedList
  """
  @spec pop(t) :: {:ok, any(), t} | {:error, :empty_list}
  def pop({}) ,do: {:error, :empty_list}
  def pop({h,t}), do: {:ok, h, t}

  @doc """
  Construct a LinkedList from a stdlib List
  """
  @spec from_list(list()) :: t
  def from_list(list, linked_list \\ new())
  def from_list([], linked_list), do: reverse(linked_list)
  def from_list([h|t], linked_list) ,do: from_list(t, push(linked_list, h)) 

  @doc """
  Construct a stdlib List LinkedList from a LinkedList
  """
  @spec to_list(t) :: list()
  def to_list(linked_list, list \\ [])
  def to_list({}, []), do: []
  def to_list({}, list), do: Enum.reverse(list)
  def to_list({h, t}, list) ,do: to_list(t, [h|list])


  @doc """
  Reverse a LinkedList
  """
  @spec reverse(t) :: t
  def reverse(linked_list, rev \\ new())
  def reverse({}, rev), do: rev
  def reverse({h, t}, rev) ,do: reverse(t, push(rev, h))
end
