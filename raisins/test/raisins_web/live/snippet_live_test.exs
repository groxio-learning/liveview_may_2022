defmodule RaisinsWeb.SnippetLiveTest do
  use RaisinsWeb.ConnCase

  import Phoenix.LiveViewTest
  import Raisins.LibraryFixtures

  @create_attrs %{name: "some name", steps: 42, text: "some text"}
  @update_attrs %{name: "some updated name", steps: 43, text: "some updated text"}
  @invalid_attrs %{name: nil, steps: nil, text: nil}

  defp create_snippet(_) do
    snippet = snippet_fixture()
    %{snippet: snippet}
  end

  describe "Index" do
    setup [:create_snippet]

    test "lists all snippets", %{conn: conn, snippet: snippet} do
      {:ok, _index_live, html} = live(conn, Routes.snippet_index_path(conn, :index))

      assert html =~ "Listing Snippets"
      assert html =~ snippet.name
    end

    test "saves new snippet", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.snippet_index_path(conn, :index))

      assert index_live |> element("a", "New Snippet") |> render_click() =~
               "New Snippet"

      assert_patch(index_live, Routes.snippet_index_path(conn, :new))

      assert index_live
             |> form("#snippet-form", snippet: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#snippet-form", snippet: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.snippet_index_path(conn, :index))

      assert html =~ "Snippet created successfully"
      assert html =~ "some name"
    end

    test "updates snippet in listing", %{conn: conn, snippet: snippet} do
      {:ok, index_live, _html} = live(conn, Routes.snippet_index_path(conn, :index))

      assert index_live |> element("#snippet-#{snippet.id} a", "Edit") |> render_click() =~
               "Edit Snippet"

      assert_patch(index_live, Routes.snippet_index_path(conn, :edit, snippet))

      assert index_live
             |> form("#snippet-form", snippet: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#snippet-form", snippet: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.snippet_index_path(conn, :index))

      assert html =~ "Snippet updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes snippet in listing", %{conn: conn, snippet: snippet} do
      {:ok, index_live, _html} = live(conn, Routes.snippet_index_path(conn, :index))

      assert index_live |> element("#snippet-#{snippet.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#snippet-#{snippet.id}")
    end
  end

  describe "Show" do
    setup [:create_snippet]

    test "displays snippet", %{conn: conn, snippet: snippet} do
      {:ok, _show_live, html} = live(conn, Routes.snippet_show_path(conn, :show, snippet))

      assert html =~ "Show Snippet"
      assert html =~ snippet.name
    end

    test "updates snippet within modal", %{conn: conn, snippet: snippet} do
      {:ok, show_live, _html} = live(conn, Routes.snippet_show_path(conn, :show, snippet))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Snippet"

      assert_patch(show_live, Routes.snippet_show_path(conn, :edit, snippet))

      assert show_live
             |> form("#snippet-form", snippet: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#snippet-form", snippet: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.snippet_show_path(conn, :show, snippet))

      assert html =~ "Snippet updated successfully"
      assert html =~ "some updated name"
    end
  end
end
