defmodule Raisins.LibraryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Raisins.Library` context.
  """

  @doc """
  Generate a snippet.
  """
  def snippet_fixture(attrs \\ %{}) do
    {:ok, snippet} =
      attrs
      |> Enum.into(%{
        name: "some name",
        steps: 42,
        text: "some text"
      })
      |> Raisins.Library.create_snippet()

    snippet
  end
end
