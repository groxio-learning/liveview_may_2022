defmodule Raisins.Picker do
  @snippets [
    %{text: "Have you tried turning it off and on again?", name: :it_crowd, steps: 3},
    %{text: "I will be back", name: :terminator, steps: 2},
    %{
      text: "I don't think that word means what you think it means.",
      name: :princess_bride,
      steps: 4
    },
    %{text: "No women, no kids.", name: :the_professional, steps: 3}
  ]
  defstruct snippets: @snippets, active_snippet: 0

  def default() do
    @snippets
  end

  # def new do
  #   __struct__()
  # end

  def new() do
    %__MODULE__{snippets: Raisins.Library.list_snippets, active_snippet: 0}
  end

  def first(picker) do
    # %__MODULE__{snippets: [Raisins.Library.get_snippet!(0)], active_snippet: 0}
    next(%{picker | active_snippet: 0})
  end

  def get(id) do
    Raisins.Library.get_snippet!(String.to_integer(id))
  end

  def next(%{snippets: snippets, active_snippet: index} = picker) do
    length = Enum.count(snippets)

    next_index =
      (index + 1)
      |> rem(length)

    %{picker | active_snippet: next_index}
  end

  def show(%{snippets: snippets, active_snippet: active_snippet}) do
    snippet =  Enum.at(snippets, active_snippet)
    %{snippet: snippet, index: snippet.id}
  end
end
