defmodule TodoList.TaskList.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :complete, :boolean, default: false
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:description, :complete])
    |> validate_required([:description, :complete])
  end
end
