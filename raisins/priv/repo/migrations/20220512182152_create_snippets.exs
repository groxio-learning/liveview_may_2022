defmodule Raisins.Repo.Migrations.CreateSnippets do
  use Ecto.Migration

  def change do
    create table(:snippets) do
      add :name, :string
      add :text, :text
      add :steps, :integer

      timestamps()
    end
  end
end
