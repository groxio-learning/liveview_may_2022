defmodule RaisinsMemo do
  def new(text_input, steps_input) do
    %{input: text_input, step: steps_input, out: text_input}
  end

  def replace(letters, word) do
    String.replace(word, letters, "_")
  end

  def erase(%{input: input, step: step, out: out}) do
    %{
      input: input,
      step: step,
      out:
        String.graphemes(out)
        |> Enum.filter(fn letter -> letter != "_" && letter != " " end)
        # |> IO.inspect
        |> Enum.take_random(step)
        |> replace(out)
    }
  end

  def show(map) do
    map.out
  end
end
