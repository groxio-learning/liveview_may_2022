defmodule Raisins.Counter do
  def new(string) do
    %{count: String.to_integer(string)}
  end

  def empty() do
    %{count: 0}
  end

  def sum(%{count: count}, step) do
    %{count: count + step}
  end

  def inc(map, step \\ 1) do
    sum(map, step)
  end

  def dec(map, step \\ 1) do
    sum(map, step * -1)
  end

  def message(map) do
    "The count is #{map.count}"
  end
end
