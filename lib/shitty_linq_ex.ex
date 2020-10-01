defmodule ShittyLinqEx do
  @moduledoc """
  Documentation for `ShittyLinqEx`.
  """

  #The append() function
  
    @doc """
    Places a new element at the end of an existing list. `list` is 
    any list or set of numeric elements and `new` is a new numeric element
    the user wants to add to the set.
    ##Examples
  
    iex> a = [1, 2, 3]
    iex> b = shittyLinqEx.append(a, 4)
    [1, 2, 3, 4]
    iex> c = shittyLinqEx.append(b, 327)
    [1, 2, 3, 4, 327]
    """

  def append(list, new) do
    list ++ [new]
  end

    @doc """
  Finds the sum of all values in a list with numeric elements.
  
  ##Examples
  
    iex> list = [1, 2, 3]
    iex> shittyLinqEx.sum(list)
    6
  """

  def sum([]) do
      0
  end
    
  def sum([h|t]) do
      h + sum(t)
  end

  def where(source, predicate) when is_list(source) do
    where_list(source, predicate)
  end

  @doc """
  Filters a sequence of values based on a predicate.
  Where `source` is an enumerable to filter.
  Where `predicate` is a function to test each element for a condition.
  Returns an enumerable that contains elements from the input sequence that satisfy the condition.
  ## Examples
    iex> import ShittyLinqEx, only: [where: 2]
    iex> where([1, 2, 3], fn x -> rem(x, 2) == 0 end)
    [2]
  """

  defp where_list([head | tail], fun) do
    case fun.(head) do
      true -> [head | where_list(tail, fun)]
      _ -> where_list(tail, fun)
    end
  end

  defp where_list([], _fun) do
    []
  end

end
