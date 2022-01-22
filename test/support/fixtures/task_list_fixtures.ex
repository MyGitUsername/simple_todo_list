defmodule TodoList.TaskListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoList.TaskList` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        complete: true,
        description: "some description"
      })
      |> TodoList.TaskList.create_item()

    item
  end
end
