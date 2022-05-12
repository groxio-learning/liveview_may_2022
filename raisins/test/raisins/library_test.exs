defmodule Raisins.LibraryTest do
  use Raisins.DataCase

  alias Raisins.Library

  describe "snippets" do
    alias Raisins.Library.Snippet

    import Raisins.LibraryFixtures

    @invalid_attrs %{name: nil, steps: nil, text: nil}

    test "list_snippets/0 returns all snippets" do
      snippet = snippet_fixture()
      assert Library.list_snippets() == [snippet]
    end

    test "get_snippet!/1 returns the snippet with given id" do
      snippet = snippet_fixture()
      assert Library.get_snippet!(snippet.id) == snippet
    end

    test "create_snippet/1 with valid data creates a snippet" do
      valid_attrs = %{name: "some name", steps: 42, text: "some text"}

      assert {:ok, %Snippet{} = snippet} = Library.create_snippet(valid_attrs)
      assert snippet.name == "some name"
      assert snippet.steps == 42
      assert snippet.text == "some text"
    end

    test "create_snippet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Library.create_snippet(@invalid_attrs)
    end

    test "update_snippet/2 with valid data updates the snippet" do
      snippet = snippet_fixture()
      update_attrs = %{name: "some updated name", steps: 43, text: "some updated text"}

      assert {:ok, %Snippet{} = snippet} = Library.update_snippet(snippet, update_attrs)
      assert snippet.name == "some updated name"
      assert snippet.steps == 43
      assert snippet.text == "some updated text"
    end

    test "update_snippet/2 with invalid data returns error changeset" do
      snippet = snippet_fixture()
      assert {:error, %Ecto.Changeset{}} = Library.update_snippet(snippet, @invalid_attrs)
      assert snippet == Library.get_snippet!(snippet.id)
    end

    test "delete_snippet/1 deletes the snippet" do
      snippet = snippet_fixture()
      assert {:ok, %Snippet{}} = Library.delete_snippet(snippet)
      assert_raise Ecto.NoResultsError, fn -> Library.get_snippet!(snippet.id) end
    end

    test "change_snippet/1 returns a snippet changeset" do
      snippet = snippet_fixture()
      assert %Ecto.Changeset{} = Library.change_snippet(snippet)
    end
  end
end
