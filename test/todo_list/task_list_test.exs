defmodule TodoList.TaskListTest do
  use TodoList.DataCase

  alias TodoList.TaskList

  describe "items" do
    alias TodoList.TaskList.Item

    import TodoList.TaskListFixtures

    @invalid_attrs %{complete: nil, description: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert TaskList.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert TaskList.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{complete: true, description: "some description"}

      assert {:ok, %Item{} = item} = TaskList.create_item(valid_attrs)
      assert item.complete == true
      assert item.description == "some description"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TaskList.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{complete: false, description: "some updated description"}

      assert {:ok, %Item{} = item} = TaskList.update_item(item, update_attrs)
      assert item.complete == false
      assert item.description == "some updated description"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = TaskList.update_item(item, @invalid_attrs)
      assert item == TaskList.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = TaskList.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> TaskList.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = TaskList.change_item(item)
    end
  end
end
