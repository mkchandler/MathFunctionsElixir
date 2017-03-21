defmodule MathFunctions do
  @moduledoc """
  Examples of math functions in Elixir.
  """

  @doc """
  Gets the min value from a list of numbers.
  """
  def min(numbers) when is_list(numbers) and length(numbers) > 0 do
    min_value(numbers, hd(numbers))
  end

  @doc """
  Gets the min value from a list of numbers.
  """
  def min(numbers) when is_list(numbers) and length(numbers) == 0 do
    raise ArgumentError, message: "List contains no elements"
  end

  defp min_value([h|t], min) when min <= h, do: min_value(t, min)
  defp min_value([h|t], min) when min > h, do: min_value(t, h)
  defp min_value([], min), do: min

  @doc """
  Gets the max value from a list of numbers.
  """
  def max(numbers) when is_list(numbers) and length(numbers) > 0 do
    max_value(numbers, hd(numbers))
  end

  @doc """
  Gets the max value from a list of numbers.
  """
  def max(numbers) when is_list(numbers) and length(numbers) == 0 do
    raise ArgumentError, message: "List contains no elements"
  end

  defp max_value([h|t], max) when max > h, do: max_value(t, max)
  defp max_value([h|t], max) when max <= h, do: max_value(t, h)
  defp max_value([], max), do: max

  @doc """
  Gets the average value from a list of numbers.
  """
  def avg(numbers) when is_list(numbers) and length(numbers) > 0  do
    avg(numbers, 0, 0)
  end

  @doc """
  Gets the average value from a list of numbers.
  """
  def avg(numbers) when is_list(numbers) and length(numbers) == 0 do
    raise ArgumentError, message: "List contains no elements"
  end

  defp avg([h|t], length, sum), do: avg(t, length + 1, sum + h)
  defp avg([], length, sum), do: sum / length

  @doc """
  Gets the mode from a list of numbers.
  """
  def mode(numbers) when is_list(numbers) and length(numbers) > 0  do
    numbers
    |> count
    |> Map.to_list
    |> mode([], 0)
  end

  @doc """
  Gets the mode from a list of numbers.
  """
  def mode(numbers) when is_list(numbers) and length(numbers) == 0 do
    raise ArgumentError, message: "List contains no elements"
  end

  defp mode([h|t], _, max_value) when max_value < elem(h, 1) do
    mode(t, [elem(h, 0)], elem(h, 1))
  end

  defp mode([h|t], modes, max_value) when max_value == elem(h, 1) do
    mode(t, modes ++ [elem(h, 0)], max_value)
  end

  defp mode([h|t], modes, max_value) when max_value > elem(h, 1) do
    mode(t, modes, max_value)
  end

  defp mode([], modes, _), do: modes

  @doc """
  Gets a Map containing the number of occurrences of each item in the list.
  """
  def count(numbers) when is_list(numbers) and length(numbers) > 0 do
    count(numbers, %{})
  end

  @doc """
  Gets a Map containing the number of occurrences of each item in the list.
  """
  def count(numbers) when is_list(numbers) and length(numbers) == 0 do
    raise ArgumentError, message: "List contains no elements"
  end

  defp count([h|t], count), do: count(t, Map.update(count, h, 1, &(&1 + 1)))
  defp count([], count), do: count

end
