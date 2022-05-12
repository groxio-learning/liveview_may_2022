# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Raisins.Repo.insert!(%Raisins.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


Raisins.Picker.default() 
|> Enum.map(fn item -> %{item | name: Kernel.to_string(item.name)} end)
|> Enum.map(&Raisins.Library.create_snippet/1)
|> IO.inspect