defmodule Raisins.Library.Snippet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "snippets" do
    field :name, :string
    field :steps, :integer
    field :text, :string

    timestamps()
  end

  @doc false
  def changeset(snippet, attrs) do
    snippet
    |> cast(attrs, [:name, :text, :steps])
    |> validate_required([:name, :text, :steps])
    |> validate_length(:text, min: 4)
  end
end
