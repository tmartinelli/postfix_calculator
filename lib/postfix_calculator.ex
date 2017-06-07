defmodule PostfixCalculator do
  @moduledoc """
    Provides method for calculating in postfix notation.
  """

  @doc """
    Calculates an expression in postfix notation mode.

  ## Examples

      iex> PostfixCalculator.calculate([2, 3, 11, "+", 5, "-", "*"])
      18

  """
  def calculate(expression) do
     heap_or_calc(expression, [])
  end

  defp heap_or_calc([], [head | _tail]), do: head

  defp heap_or_calc(["+" | tail], [second, first | stack_tail]) do
    heap_or_calc(tail, [first + second | stack_tail])
  end

  defp heap_or_calc(["*" | tail], [second, first | stack_tail]) do
    heap_or_calc(tail, [first * second | stack_tail])
  end

  defp heap_or_calc(["-" | tail], [second, first | stack_tail]) do
    heap_or_calc(tail, [first - second | stack_tail])
  end

  defp heap_or_calc(["/" | tail], [second, first | stack_tail]) do
    heap_or_calc(tail, [div(first, second) | stack_tail])
  end

  defp heap_or_calc([head | tail], stack), do: heap_or_calc(tail, [head | stack])
end
