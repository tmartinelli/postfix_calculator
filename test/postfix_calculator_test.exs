defmodule PostfixCalculatorTest do
  use ExUnit.Case
  doctest PostfixCalculator

  test "simple addition" do
    assert PostfixCalculator.calculate([4, 2, "+"]) == 6
  end

  test "simple subtraction" do
    assert PostfixCalculator.calculate([4, 2, "-"]) == 2
  end

  test "simple multiplication" do
    assert PostfixCalculator.calculate([4, 2, "*"]) == 8
  end

  test "simple division" do
    assert PostfixCalculator.calculate([4, 2, "/"]) == 2
  end

  test "addition and subtraction" do
    assert PostfixCalculator.calculate([4, 2, "+", 3, "-"]) == 3
  end

  test "addition and multiplication" do
    assert PostfixCalculator.calculate([4, 2, "+", 3, "*"]) == 18
  end

  test "addition and division" do
    assert PostfixCalculator.calculate([4, 2, "+", 3, "/"]) == 2
  end

  test "subtraction and multiplication" do
    assert PostfixCalculator.calculate([4, 2, "-", 3, "*"]) == 6
  end

  test "subtraction and division" do
    assert PostfixCalculator.calculate([8, 2, "-", 3, "/"]) == 2
  end

  test "multiplication and division" do
    assert PostfixCalculator.calculate([6, 2, "*", 3, "/"]) == 4
  end

  test "all operations" do
    assert PostfixCalculator.calculate([2, 3, 11, "+", 5, "-", "*", 6, "/"]) == 3
  end
end
