defmodule Raisins.Library.Snippet.Query do
  alias Raisins.Library.Snippet, as: Snippet
  import Ecto.Query

  def new do
    Snippet
  end

  def next(q, snippet) do
    from(s in q, where: s.id > ^snippet.id, limit: 1)
  end

  def first(q) do
    from(s in q, limit: 1)
  end
end
