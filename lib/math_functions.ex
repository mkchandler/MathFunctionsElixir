defmodule MathFunctions do
  @moduledoc """
  Documentation for MathFunctions.
  """

  @doc """
  Gets the min value from a list of numbers.
  """
  def min(numbers) when length(numbers) > 0 do
    min_value(numbers, hd(numbers))
  end

  def min(numbers) when length(numbers) == 0 do
    raise ArgumentError, message: "List contains no elements"
  end

  defp min_value([h|t], min) when min <= h, do: min_value(t, min)
  defp min_value([h|t], min) when min > h, do: min_value(t, h)
  defp min_value([], min), do: min   

  @doc """
  Gets the max value from a list of numbers.
  """
  def max(numbers) when length(numbers) > 0 do
    max_value(numbers, hd(numbers))
  end

  def max(numbers) when length(numbers) == 0 do
    raise ArgumentError, message: "List contains no elements"
  end

  defp max_value([h|t], max) when max > h, do: max_value(t, max)
  defp max_value([h|t], max) when max <= h, do: max_value(t, h)
  defp max_value([], max), do: max   

  @doc """
  Gets the average value from a list of numbers.
  """
  def avg(numbers) do
    avg(numbers, 0, 0)
  end

  defp avg([h|t], length, sum), do: avg(t, length + 1, sum + h)
  defp avg([], length, sum), do: sum / length
end
