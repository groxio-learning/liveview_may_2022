defmodule Raisins.Eraser do
    defstruct ~w[text steps]a
    @ignore [" ", ",", "_", "?", "."]
  
    def new(text, steps) do
      length = String.length(text)
      chunk_size = 
        length 
        |> Kernel./(steps)
        |> ceil()
  
      plan = 
        0..(length - 1)
        |> Enum.shuffle()
        |> Enum.chunk_every(chunk_size)
  
      %__MODULE__{text: text, steps: plan}
    end
    
    def erase(%{steps: [step | steps], text: text} = eraser) do
      %{eraser | text: replace_characters(text, step), steps: steps}
    end
  
    defp replace_characters(text, position_list) do
      text 
      |> String.graphemes()
      |> Enum.with_index()
      |> Enum.map(fn {character, index} = tuple ->
        replace_character(tuple, index in position_list)
      end)
      |> Enum.join()
    end
  
    defp replace_character({char, _position}, _) when char in @ignore, do: char
    defp replace_character({_character, position}, true), do: "_"
    defp replace_character({character, _position}, false), do: character
  
    def show(eraser), do: eraser.text
end