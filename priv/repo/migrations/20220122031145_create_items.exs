defmodule TodoList.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :description, :string, null: false
      add :complete, :boolean, default: false, null: false

      timestamps()
    end
  end
end
