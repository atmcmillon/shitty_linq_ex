defmodule ShittyLinqEx do
  @moduledoc """
  Documentation for `ShittyLinqEx`.
  """

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
  def where(source, predicate) when is_list(source) do
    where_list(source, predicate)
  end

  defp where_list([head | tail], fun) do
    case fun.(head) do
      true -> [head | where_list(tail, fun)]
      _ -> where_list(tail, fun)
    end
  end

  defp where_list([], _fun) do
    []
  end

  #The sum() function
  
  @doc """
  Finds the sum of all values in a list with numeric elements.
  
  ##Examples
  
    iex> list = [1, 2, 3]
    iex> shittyLINQ.sum(list)
    6
  """

  def sum([]) do
      0
  end
    
  def sum([h|t]) do
      h + sum(t)
  end
      
#The concat() function
  
  @doc """
  Places the elements of two lists into one(concatenate)
  
  ##Examples
  
    iex> a = [1, 2, 3]
    iex> b = [4, 5, 6]
    iex> shittyLINQ.concat(a, b)
    [1, 2, 3, 4, 5, 6] 
  """
  def concat(list1, list2) do
        list1 ++ list2
  end
  
  #The append() function
  
  @doc """
  Places a new element at the end of an existing list
  
  ##Examples
  
    iex> a = [1, 2, 3]
    iex> b = shittyLINQ.append(a, 4)
    [1, 2, 3, 4]
    iex> c = shittyLINQ.append(b, 327)
    [1, 2, 3, 4, 327]
  """
  def append(list, new) do
      list ++ [new]
  end
end
