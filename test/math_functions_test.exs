defmodule MathFunctionsTest do
  use ExUnit.Case

  test "return min value from list of numbers" do
    numbers = [56, 17, 10, 10, 21, 12, 32]
    min = MathFunctions.min(numbers)
    assert min == 10
  end

  test "return error when min is called with empty list" do
    assert_raise ArgumentError, fn ->
      MathFunctions.min([])
    end
  end

  test "return max value from list of numbers" do
    numbers = [56, 17, 10, 73, 21, 12, 32]
    max = MathFunctions.max(numbers)
    assert max == 73
  end

  test "return error when max is called with empty list" do
    assert_raise ArgumentError, fn ->
      MathFunctions.max([])
    end
  end

  test "return average value from list of numbers" do
    numbers = [4, 8, 15, 16, 23, 42]
    avg = MathFunctions.avg(numbers)
    assert avg == 18.0
  end

  test "return error when avg is called with empty list" do
    assert_raise ArgumentError, fn ->
      MathFunctions.avg([])
    end
  end

  test "return single mode from list of numbers" do
    numbers = [1, 2, 2, 2, 3, 3]
    mode = MathFunctions.mode(numbers)
    assert mode == [2]
  end

  test "return multiple modes from list of numbers" do
    numbers = [1, 2, 2, 2, 3, 3, 3]
    mode = MathFunctions.mode(numbers)
    assert mode == [2, 3]
  end

  test "return error when mode is called with empty list" do
    assert_raise ArgumentError, fn ->
      MathFunctions.mode([])
    end
  end

  test "get a count of all items in a list" do
    numbers = [1, 2, 2, 2, 3, 3]
    count = MathFunctions.count(numbers)
    assert count == %{1 => 1, 2 => 3, 3 => 2}
  end

  test "return error when count is called with empty list" do
    assert_raise ArgumentError, fn ->
      MathFunctions.count([])
    end
  end
end
