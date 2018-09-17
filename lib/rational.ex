defmodule Rational do
  @moduledoc """
  A module for rational number calicuration.
  Tupples describe rational numbers here.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Rational.hello()
      :world

  """


  import Kernel, except: [div: 2]
  require Integer
  
  def add({n1, d1}, {n2, d2}) do
    [{x, c}, {y, c}] = rcd([{n1, d1}, {n2, d2}])
    {x + y, c}
  end

  def sub({n1, d1}, {n2, d2}) do
    [{x, c}, {y, c}] = rcd([{n1, d1}, {n2, d2}])
    {x - y, c}
  end

  def mul({n1, d1}, {n2, d2}) do
    rof({n1 * n2, d1 * d2})
  end

  def div({n1, d1}, {n2, d2}) do
    rof({n1 * d2, d1 * n2})
  end

  # Reduction of Fraction
  def rof({n, d}) do
    {Kernel.div(n, Integer.gcd(n, d)), Kernel.div(d, Integer.gcd(n, d))}
  end

  # Reduction to Common Denominator
  def rcd([{n1, d1}, {n2, d2}]) do
    d = d1 * d2 * Integer.gcd(d1, d2) # Least Common Muliple of d1 and d2
    [{Kernel.div(n1 * d, d1), d}, {Kernel.div(n2 * d, d2), d}]
  end
end

# numerator/denominator
