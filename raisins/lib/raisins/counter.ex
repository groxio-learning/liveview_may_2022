defmodule Raisins.Counter do
  def new(string) do
    String.to_integer(string)
  end

  def inc(number) do
    number + 1
  end

  def message(number) do
    "The count is #{number}"
  end
end
