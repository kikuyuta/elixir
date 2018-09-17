defmodule Rational do

  @moduledoc """
  A simple sample module for rational number calicuration.
  """

  @doc """
  - Types
  There is not new defined types.
  Tupples describe rational numbers here.
  The module might define a new rational type hiding numerator/denominator.

  - Functions
  -- add/2
     addition of two rational numbers
  -- sub/2
     subtraction of two rational numbers
  -- mul/2
     muliplication of two rational numbers
  -- div/2
     division of two rational numbers
  -- rof/1
     Reduction of Fraction of a rational number
  -- rcd/2
     Reduction to Common Denominator of a list of two rational numbers.
     Returns a list of two rational numbers whose denominators are the same.
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

  def rof({n, d}) do
    {Kernel.div(n, Integer.gcd(n, d)), Kernel.div(d, Integer.gcd(n, d))}
  end

  def rcd([{n1, d1}, {n2, d2}]) do
    d = d1 * d2 * Integer.gcd(d1, d2) # Least Common Muliple of d1 and d2
    [{Kernel.div(n1 * d, d1), d}, {Kernel.div(n2 * d, d2), d}]
  end
end
